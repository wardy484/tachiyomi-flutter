import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_state.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manga_details_controller.g.dart';

@riverpod
class MangaDetailsController extends _$MangaDetailsController {
  @override
  FutureOr<MangaDetailsState> build(Source source, String mangaId) {
    final favourite = ref
        .watch(
          favouriteBySourceProvider(source, mangaId),
        )
        .valueOrNull;

    if (favourite == null) {
      return _getFromSource(source, mangaId);
    }

    return MangaDetailsState(
      details: favourite.toManga(),
      chapters: ChapterList(favourite.chapters),
      favourite: favourite,
    );
  }

  Future<MangaDetailsState> _getFromSource(
    Source source,
    String mangaId,
  ) async {
    final futures = FutureGroup();

    futures.add(compute(_getMangaDetails, {
      'sourceSchema': source.schema.toJson(),
      'mangaId': mangaId,
    }));

    futures.add(compute(_getChapters, {
      'sourceSchema': source.schema.toJson(),
      'mangaId': mangaId,
    }));

    futures.close();

    final futuresResult = await futures.future;

    final details = futuresResult[0];
    final chapters = futuresResult[1];

    return MangaDetailsState(
      details: details,
      chapters: chapters,
      favourite: null,
    );
  }
}

Future<Manga> _getMangaDetails(Map<String, dynamic> args) async {
  final sourceSchemaJson = args['sourceSchema'];
  final mangaId = args['mangaId'] as String;

  final sourceSchema = SourceSchema.fromJson(sourceSchemaJson);
  final source = Source.fromSchema(sourceSchema);

  return await source.getMangaDetails(mangaId);
}

Future<ChapterList> _getChapters(Map<String, dynamic> args) async {
  final sourceSchemaJson = args['sourceSchema'];
  final mangaId = args['mangaId'] as String;

  final sourceSchema = SourceSchema.fromJson(sourceSchemaJson);
  final source = Source.fromSchema(sourceSchema);

  return await source.getChapters(mangaId);
}
