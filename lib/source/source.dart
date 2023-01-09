import 'package:flutter/services.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/source/parsers/chapter_details_parser.dart';
import 'package:fluttiyomi/source/parsers/chapters_parser.dart';
import 'package:fluttiyomi/source/parsers/home_sections_parser.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/scraper/parsers/search_parser.dart';
import 'package:fluttiyomi/source/scraper/scraper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';

final sourceProvider = Provider<Source>(
  (ref) => Source(),
);

class Source {
  final Scraper scraper = Scraper();
  late final SourceSchema schema;

  Source();

  get name => schema.info.name;
  get id => schema.info.id;

  Future<void> initialise() async {
    final sourceConfig = await rootBundle.loadString(
      // 'assets/sources/mangajar.yml',
      'assets/sources/readm.yml',
    );

    final YamlMap yaml = loadYaml(sourceConfig);
    schema = SourceSchema.fromYaml(yaml);
  }

  Future<Manga> getMangaDetails(String mangaId) async {
    final mangaDetails = await scraper.scrape(
      schema.mangaDetails,
      params: {
        'mangaId': mangaId,
      },
    );

    return Manga.fromJson({
      'langCode': 'en',
      'id': mangaId,
      'altTitles': [],
      'hentai': false,
      ...mangaDetails,
      'tags': [
        {
          'id': "0",
          'label': 'genres',
          'tags': mangaDetails['tags'],
        }
      ]
    });
  }

  Future<ChapterList> getChapters(String mangaId) async {
    final List<Chapter> allChapters = [];

    if (schema.chapters.request.paged) {
      int page = 1;
      bool hasNextPage = true;

      while (hasNextPage) {
        final results = await scraper.scrape(
          schema.chapters,
          params: {
            'mangaId': mangaId,
          },
          query: schema.chapters.request.buildQuery(args: {
            'page': page,
          }),
        );

        final chapters = ChaptersParser.parse(results, mangaId: mangaId);

        if (chapters.isEmpty) {
          hasNextPage = false;
        } else {
          allChapters.addAll(chapters);
          page++;
        }
      }

      return ChapterList(allChapters);
    } else {
      final results = await scraper.scrape(
        schema.chapters,
        params: {
          'mangaId': mangaId,
        },
        query: schema.chapters.request.buildQuery(),
      );

      allChapters.addAll(
        ChaptersParser.parse(results, mangaId: mangaId),
      );
    }

    return ChapterList(allChapters);
  }

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
  ) async {
    final chapterDetails = await scraper.scrape(
      schema.chapterDetails,
      params: {
        'mangaId': mangaId,
        'chapterId': chapterId,
      },
    );

    return ChapterDetailsParser.parse(
      chapterDetails,
      mangaId: mangaId,
      chapterId: chapterId,
    );
  }

  Future<List<HomeSection>> getHomeSections() async {
    final results = await scraper.scrape(schema.home);

    return HomeSectionsParser.parse(results);
  }

  Future<PagedResults> search(String query) async {
    // TODO: Implement paging
    final body = schema.search.request.buildBody({
      'query': query,
    });

    final queryParams = schema.search.request.buildQuery(args: {
      'query': query,
    });

    final result = await scraper.scrape(
      schema.search,
      body: body,
      query: queryParams,
    );

    return SearchResultsParser.parse(result);
  }
}
