import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/database/chapter_details_model.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

Future<ChapterDetails> fetchChapterDetails(
  Ref ref,
  Source source,
  String mangaId,
  String chapterId,
) async {
  final cached = await ref.read(chapterDetailsCacheRepositoryProvider).get(
        source.id,
        mangaId,
        chapterId,
      );

  if (cached != null) {
    log('Chapter details cache hit: $chapterId');
    return cached;
  }

  final chapterDetails = await compute(_getChapterDetails, {
    'sourceSchema': source.schema.toJson(),
    'mangaId': mangaId,
    'chapterId': chapterId,
  });

  return await ref
      .read(chapterDetailsCacheRepositoryProvider)
      .cache(source.id, chapterDetails);
}

Future<ChapterDetails> _getChapterDetails(Map<String, dynamic> args) async {
  final sourceSchemaJson = args['sourceSchema'];
  final mangaId = args['mangaId'] as String;
  final chapterId = args['chapterId'] as String;

  final sourceSchema = SourceSchema.fromJson(sourceSchemaJson);
  final source = Source.fromSchema(sourceSchema);

  return await source.getChapterDetails(mangaId, chapterId);
}

final chapterDetailsCacheRepositoryProvider = Provider((ref) {
  final db = ref.watch(isarDatabaseProvider).isar;

  return ChapterDetailsCacheRepository(db: db);
});

class ChapterDetailsCacheRepository {
  final Isar db;

  ChapterDetailsCacheRepository({
    required this.db,
  });

  Future<ChapterDetails> cache(
      String sourceId, ChapterDetails chapterDetails) async {
    final cache = ChapterDetailsCache()
      ..sourceId = sourceId
      ..chapterId = chapterDetails.id
      ..mangaId = chapterDetails.mangaId
      ..pages = chapterDetails.pages
      ..longStrip = chapterDetails.longStrip;

    await db.writeTxn(() async {
      await db.chapterDetailsCaches.put(cache);
    });

    log('Chapter details cache update: ${chapterDetails.id}');

    return chapterDetails;
  }

  Future<ChapterDetails?> get(
    String sourceId,
    String mangaId,
    String chapterId,
  ) async {
    final cache = await db.chapterDetailsCaches
        .where()
        .sourceIdMangaIdChapterIdEqualTo(sourceId, mangaId, chapterId)
        .findFirst();

    if (cache is ChapterDetailsCache) {
      return cache.toChapterDetails();
    }

    return null;
  }
}
