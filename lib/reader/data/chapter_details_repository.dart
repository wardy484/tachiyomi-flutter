import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapter_details_repository.g.dart';

@riverpod
FutureOr<ChapterDetails> chapterDetails(
    Ref ref, String mangaId, String chapterId) {
  return compute(_getChapterDetails, {
    'sourceSchema': ref.watch(sourceProvider).schema.toJson(),
    'mangaId': mangaId,
    'chapterId': chapterId,
  });
}

Future<ChapterDetails> _getChapterDetails(Map<String, dynamic> args) async {
  final sourceSchemaJson = args['sourceSchema'];
  final mangaId = args['mangaId'] as String;
  final chapterId = args['chapterId'] as String;

  final sourceSchema = SourceSchema.fromJson(sourceSchemaJson);
  final source = Source.fromSchema(sourceSchema);

  return await source.getChapterDetails(mangaId, chapterId);
}
