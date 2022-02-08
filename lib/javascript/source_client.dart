import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/data/search_results/searchresults.dart';
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
    js.evaluate("""var window = global = self = globalThis;""");
    js.evaluate(sourceCode);
    js.evaluate("console.log('this'); console.log(globalThis.MangaFox);");
    js.evaluate("var $src = globalThis.MangaFox;");
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

  static Future<SourceClient> init(
      {String sourcePath = "assets/index.js"}) async {
    String sourceFile = await rootBundle.loadString(sourcePath);

    return SourceClient(sourceFile);
  }

  Future<SearchResults> search(String query) async {
    String page = await getPage("$src.getSearchRequest(`$query`)");

    var json = parseList(page, "$src.parseSearchResults(page)");

    return SearchResults.fromJson(json);
  }

  Future<ChapterList> getChapters(String mangaId) async {
    String id = Uri.encodeQueryComponent(mangaId);
    String page = await getPage("$src.getChaptersRequest(`$id`)");

    var json = parseList(page, "$src.parseChaptersResult(page, '$mangaId')");

    return ChapterList.fromJson(json).descending();
  }

  Future<Manga> getMangaDetails(String mangaId) async {
    String id = Uri.encodeQueryComponent(mangaId);
    String page = await getPage("$src.getMangaDetailsRequest(`$id`)");

    var json = parseList(page, "$src.getMangaDetails(page, '$mangaId')");

    return Manga.fromJson(json);
  }

  Future<ChapterDetails> getChapterDetails(
      String mangaId, String chapterId) async {
    String decodedMangaId = Uri.encodeQueryComponent(mangaId);
    String decodedChapterId = Uri.encodeQueryComponent(chapterId);

    String page = await getPage(
      "$src.getChapterDetailsRequest(`$decodedMangaId`, `$decodedChapterId`)",
    );

    var json = parseList(
      page,
      "$src.getChapterDetails(page, '$decodedMangaId', `$decodedChapterId`)",
    );

    return ChapterDetails.fromJson(json);
  }

  Future<String> getPage(String jsCode) async {
    JsEvalResult searchRequest = js.evaluate("getPage(() => $jsCode)");

    Request req = Request.fromJson(searchRequest.stringResult);

    var res = await dio.get(req.url);

    return Uri.encodeFull(res.data);
  }

  dynamic parseList(String page, String code) {
    JsEvalResult result = js.evaluate(
      "getObject(`$page`, (page) => $code)",
    );
    return jsonDecode(result.stringResult);
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
