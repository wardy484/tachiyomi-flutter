import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/javascript/scraper.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/javascript/yaml/schema.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:yaml/yaml.dart';

final yamlSourceProvder = Provider<YamlSourceClient>(
  (ref) => YamlSourceClient("https://manga-source-proxy.vercel.app/"),
);

class YamlSourceClient extends SourceClient {
  late final SourceSchema schema;
  late final Dio apiClient;

  final Scraper scraper = Scraper();

  YamlSourceClient(String baseUrl) : super(baseUrl);

  @override
  Future<void> initialise() async {
    final sourceConfig = await rootBundle.loadString(
      'assets/sources/readm.yml',
    );

    final YamlMap yaml = loadYaml(sourceConfig);
    schema = SourceSchema.fromYaml(yaml);
    apiClient = Dio();
  }

  // TODO: Implement search

  @override
  Future<Manga> getMangaDetails(String mangaId) async {
    // return super.getMangaDetails(mangaId);
    final document = await _makeRequest(
      schema.mangaDetails.request,
      args: {
        'mangaId': mangaId,
      },
    );

    final mangaDetails = scraper.parsePage(schema.mangaDetails, document);

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
    final document = await _makeRequest(
      schema.chapters.request,
      args: {
        'mangaId': mangaId,
      },
    );

    final chapterList = scraper.parsePage(schema.chapters, document);

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
    final document = await _makeRequest(
      schema.chapterDetails.request,
      args: {
        'mangaId': mangaId,
        'chapterId': chapterId,
      },
    );

    final chapterDetails = scraper.parsePage(schema.chapterDetails, document);

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
    final document = await _makeRequest(schema.home.request);

    final results = scraper.parsePage(schema.home, document);
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

  // override the search method
  @override
  Future<PagedResults> search(String query) async {
    return await super.search(query);

    final page = await apiClient.get("/search/$query");
    Document document = parse(page.data);

    // final results = scraper.parsePage(schema.search, document);
    // final List<Manga> mangas = [];
    // for (var manga in results['mangas']) {
    //   mangas.add(Manga.fromJson({
    //     'langCode': 'en',
    //     'altTitles': [],
    //     'hentai': false,
    //     ...manga,
    //   }));
    // }

    // return mangas;
  }

  Future<Document> _makeRequest(
    RequestSchema request, {
    Map<String, String>? args,
  }) async {
    final url = request.buildUrl(args: args);
    final page = await apiClient.get(url);

    return parse(page.data);
  }
}
