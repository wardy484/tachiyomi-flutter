import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sourceClientProvider = StateProvider<SourceClient>(
  (ref) => SourceClient(""),
);

class SourceClient {
  final JavascriptRuntime js = getJavascriptRuntime();
  final Dio dio = Dio();
  String src = "mangaFox";

  SourceClient(String sourceCode) {
    js.enableHandlePromises();

    if (sourceCode == "") {
      return;
    }

    js.evaluate("""var window = global = self = globalThis;""");
    js.evaluate(sourceCode);
    js.evaluate("console.log(Object.keys(globalThis))");
    js.evaluate("var $src = globalThis.MangaFox;");
    js.evaluate("var readm = globalThis.MangaFox.createReadm();");

    js.evaluate("""
        var getPage = (callback) => {
          var result = callback();
          return JSON.stringify(result);
        };
      """);

    js.evaluate("""var getObject = (encodedPage, callback) => {
        var page = decodeURI(encodedPage);
        var result = callback(page);
        return JSON.stringify(result);
        };
      """);
  }

  static Future<SourceClient> init({
    String sourcePath = "assets/wanker.js",
  }) async {
    String sourceFile = await rootBundle.loadString(sourcePath);

    return SourceClient(sourceFile);
  }

  Future<PagedResults> search(String query) async {
    try {
      var json = await executeJS(
        "readm.getSearchResults({ title: `$query` });",
      );
      return PagedResults.fromJson(json);
    } catch (e) {
      print(
        "Probably an empty set of results but the readm parse is shit so it threw an exception",
      );
      print(e);
      return PagedResults(results: []);
    }
  }

  Future<ChapterList> getChapters(String mangaId) async {
    String id = Uri.encodeQueryComponent(mangaId);
    var json = await executeJS("readm.getChapters(`$id`);") as List;

    return ChapterList(
      json.map((e) => Chapter.fromJson(e)).toList(),
    );
  }

  Future<Manga> getMangaDetails(String mangaId) async {
    var json = await executeJS("readm.getMangaDetails(`$mangaId`);");
    return Manga.fromJson(json);
  }

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
  ) async {
    String decodedMangaId = Uri.encodeQueryComponent(mangaId);
    String decodedChapterId = Uri.encodeQueryComponent(chapterId);

    var json = await executeJS(
      "readm.getChapterDetails(`$decodedMangaId`, `$decodedChapterId`)",
    );

    return ChapterDetails.fromJson(json);
  }

  Future<dynamic> executeJS(String script) async {
    JsEvalResult request = js.evaluate(script);

    var newResult = await js.handlePromise(request);
    var json = jsonDecode(newResult.stringResult);
    return json;
  }
}

class Request {
  final String url;

  Request(this.url);

  static Request fromJson(String json) {
    Map data = jsonDecode(json);

    String url = data["url"];

    return Request(url);
  }
}
