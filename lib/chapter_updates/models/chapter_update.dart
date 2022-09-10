import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_update.freezed.dart';
part 'chapter_update.g.dart';

@freezed
class ChapterUpdate with _$ChapterUpdate {
  const factory ChapterUpdate({
    required String sourceId,
    required String mangaId,
    required double chapterNumber,
    required String imagePath,
    required String name,
    required DateTime addedAt,
    required bool read,
  }) = _ChapterUpdate;

  factory ChapterUpdate.fromJson(Map<String, dynamic> json) =>
      _$ChapterUpdateFromJson(json);
}
