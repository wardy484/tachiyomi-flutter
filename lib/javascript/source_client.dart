import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:fluttiyomi/data/updated_chapters/updated_chapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
  final Dio _dio;
  final String _baseUrl;

  final String src;

  get sourceId {
    return src;
  }

  get sourceName {
    return "Readm";
  }

  SourceClient(String baseUrl)
      : _baseUrl = baseUrl,
        src = "readm",
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );

  static Future<SourceClient> init({
    String baseUrl = "https://manga-source-proxy.vercel.app/",
  }) async {
    return SourceClient(baseUrl);
  }

  Future<PagedResults> search(String query) async {
    try {
      var response = await _dio.get(
        "/",
        queryParameters: {"manga": query},
      );

      return PagedResults.fromJson(response.data);
    } catch (e) {
      return PagedResults(results: []);
    }
  }

  Future<ChapterList> getChapters(String mangaId) async {
    var response = await _dio.get("/manga/$mangaId/chapters");
    return compute(parseChapters, response.data);
  }

  Future<Manga> getMangaDetails(String mangaId) async {
    var response = await _dio.get("/manga/$mangaId");
    return Manga.fromJson(response.data);
  }

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
  ) async {
    String decodedMangaId = Uri.encodeQueryComponent(mangaId);
    String decodedChapterId = Uri.encodeQueryComponent(chapterId);

    var response = await _dio.get(
      "/manga/$decodedMangaId/chapters/$decodedChapterId",
    );

    return ChapterDetails.fromJson(response.data);
  }

  Future<UpdatedChapters> checkForUpdates(
    List<String> mangaIds,
    DateTime lastCheckedAt,
  ) async {
    String ids = mangaIds.map((e) => "'$e'").toString();

    var response = await _dio.post(
      "/updated-manga",
      data: {
        "ids": ids,
        "time": DateFormat.yMd().add_jm().format(lastCheckedAt),
      },
    );

    return UpdatedChapters.fromJson(response.data);
  }

  Future<List<HomeSection>> getHomeSections() async {
    var data = (await _dio.get('/home')) as List;

    return data.map((e) {
      return HomeSection.fromJson(e);
    }).toList();
  }
}
