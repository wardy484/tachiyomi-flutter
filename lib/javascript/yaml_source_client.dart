import 'package:flutter/services.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/javascript/scraper.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/javascript/scraper/schema.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';

final yamlSourceProvder = Provider<YamlSourceClient>(
  (ref) => YamlSourceClient(),
);

class YamlSourceClient extends SourceClient {
  late final SourceSchema schema;

  YamlSourceClient() : super("");

  @override
  Future<void> initialise() async {
    final sourceConfig = await rootBundle.loadString(
      'assets/sources/mangajar.yml',
    );

    final YamlMap yaml = loadYaml(sourceConfig);
    schema = SourceSchema.fromYaml(yaml);
  }

  @override
  Future<Manga> getMangaDetails(String mangaId) async {
    // return super.getMangaDetails(mangaId);
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

  @override
  Future<ChapterList> getChapters(String mangaId) async {
    // return super.getChapters(mangaId);
    // TODO: Implement paging
    final chapterList = await scraper.scrape(
      schema.chapters,
      params: {
        'mangaId': mangaId,
      },
    );

    assert(chapterList['chapters'] != null);
    assert(chapterList['chapters'] is List<dynamic>);

    final List<Chapter> chapters = [];

    for (int i = 0; i < chapterList['chapters'].length; i++) {
      chapters.add(Chapter.fromJson({
        'langCode': 'en',
        'mangaId': mangaId,
        ...chapterList['chapters'][i],
      }));
    }

    return ChapterList(chapters);
  }

  @override
  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
  ) async {
    // return super.getChapterDetails(mangaId, chapterId);
    final chapterDetails = await scraper.scrape(
      schema.chapterDetails,
      params: {
        'mangaId': mangaId,
        'chapterId': chapterId,
      },
    );

    return ChapterDetails.fromJson({
      ...chapterDetails,
      'longStrip': false,
      'mangaId': mangaId,
      'id': chapterId,
    });
  }

  @override
  Future<List<HomeSection>> getHomeSections() async {
    // return await super.getHomeSections();
    final results = await scraper.scrape(schema.home);

    if (results['home_sections'] is Map<String, dynamic>) {
      final homeSections = results['home_sections'] as Map<String, dynamic>;
      final List<HomeSection> sections = [];

      for (var key in homeSections.keys) {
        final section = homeSections[key];
        sections.add(HomeSection.fromJson({
          'id': key,
          'title': section['title'],
          'items': section['items'],
        }));
      }

      return sections;
    }

    if (results['home_sections'] is List) {
      final homeSections = results['home_sections'] as List<dynamic>;
      final List<HomeSection> sections = [];

      for (var section in homeSections) {
        final items = section['items'];

        if (items is! List || items.isEmpty) continue;

        sections.add(HomeSection.fromJson({
          'id': section['id'],
          'title': section['title'],
          'items': section['items'],
        }));
      }

      return sections;
    }

    return [];
  }

  @override
  Future<PagedResults> search(String query) async {
    // return await super.search(query);
    // TODO: Implement paging
    final body = schema.search.request.buildBody({
      'query': query,
    });

    final queryParams = schema.search.request.buildQuery({
      'query': query,
    });

    final result = await scraper.scrape(
      schema.search,
      body: body,
      query: queryParams,
    );

    return PagedResults.fromJson(result);
  }
}
