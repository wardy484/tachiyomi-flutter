import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapters_state.freezed.dart';

@freezed
class ChaptersState with _$ChaptersState {
  const factory ChaptersState.initial() = _Initial;
  const factory ChaptersState.loaded(ChapterList chapters) = _Loaded;
}
