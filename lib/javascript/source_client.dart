import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

ChapterList parseChapters(dynamic json) {
  List<Chapter> chapters = [];

  for (var i = 0; i < json.length; i++) {
    var current = json[i];
    chapters.add(Chapter.fromJson(current));
  }

  return ChapterList(chapters);
}

class SourceClient {
  final JavascriptRuntime js = getJavascriptRuntime();
  final Dio dio = Dio();
  String src = "mangaFox";

  get sourceId {
    return src;
  }

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
      return PagedResults(results: []);
    }
  }

  Future<ChapterList> getChapters(String mangaId) async {
    String id = Uri.encodeQueryComponent(mangaId);

    var json = await executeJS("readm.getChapters(`$id`);");
    return compute(parseChapters, json);
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

  Future<void> checkForUpdates(
    List<String> mangaIds,
    DateTime lastCheckedAt,
    Function(List<String> updated) onUpdated,
  ) async {
    String ids = mangaIds.map((e) => "'$e'").toString();
    DateTime d = lastCheckedAt;

    js.onMessage('newChapters', (dynamic updated) {
      var updatedChapters = updated['ids'] as List;
      onUpdated(updatedChapters.map<String>((e) => e as String).toList());
    });

    JsEvalResult request = js.evaluate("""
      readm.filterUpdatedManga(
        (updates) => {
          sendMessage('newChapters', JSON.stringify(updates));
        },
        new Date(${d.year}, ${d.month - 1}, ${d.day}, ${d.hour}, ${d.minute}, ${d.second}),
        $ids,
      )
    """);

    await js.handlePromise(request);
  }

  Future<dynamic> executeJS(String script) async {
    JsEvalResult request = js.evaluate(script);

    var newResult = await js.handlePromise(request);

    var json = await compute(jsonDecode, newResult.stringResult);
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
