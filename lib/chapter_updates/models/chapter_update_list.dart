import 'package:fluttiyomi/chapter_updates/models/chapter_update.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_update_list.freezed.dart';
part 'chapter_update_list.g.dart';

@freezed
class ChapterUpdateList with _$ChapterUpdateList {
  const factory ChapterUpdateList({
    required List<ChapterUpdate> chapterUpdates,
  }) = _ChapterUpdateList;

  const ChapterUpdateList._();

  factory ChapterUpdateList.fromJson(Map<String, dynamic> json) =>
      _$ChapterUpdateListFromJson(json);

  bool get isEmpty => chapterUpdates.isEmpty;
}
