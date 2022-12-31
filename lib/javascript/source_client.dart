import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:fluttiyomi/data/updated_chapters/updated_chapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final sourceClientProvider = Provider<SourceClient>(
  (ref) => SourceClient("https://manga-source-proxy.vercel.app/"),
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
  late Dio _dio;
  // ignore: unused_field
  late String _baseUrl;

  late String src;

  get sourceId {
    return src;
  }

  get sourceName {
    return "Readm";
  }

  SourceClient(String baseUrl) {
    _baseUrl = baseUrl;
    src = "readm";
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    _dio.interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: baseUrl,
          defaultMaxAge: Duration.zero,
        ),
      ).interceptor,
    );

    _dio.interceptors.add(dioLoggerInterceptor);
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
    log("Getting chapters from source for $mangaId");
    var response = await _dio.get("/manga/$mangaId/chapters");
    log("Got a response: ${response.data.toString()}");
    return parseChapters(response.data);
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
      options: buildCacheOptions(const Duration(days: 365)),
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
    var data = (await _dio.get('/home')).data as List;

    return data.map((e) {
      return HomeSection.fromJson(e);
    }).toList();
  }
}
