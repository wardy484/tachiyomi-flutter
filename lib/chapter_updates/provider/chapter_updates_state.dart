import 'package:fluttiyomi/chapter_updates/models/chapter_update_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_updates_state.freezed.dart';

@freezed
class ChapterUpdatesState with _$ChapterUpdatesState {
  const factory ChapterUpdatesState.initial() = _Initial;
  const factory ChapterUpdatesState.loaded(
    ChapterUpdateList chapterUpdates,
  ) = _Loaded;
}
