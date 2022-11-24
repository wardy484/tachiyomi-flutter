import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_details_state.freezed.dart';

@freezed
class ChapterDetailsState with _$ChapterDetailsState {
  const factory ChapterDetailsState.initial() = _Initial;
  const factory ChapterDetailsState.loaded(
    ChapterDetailsContent content,
  ) = _Loaded;

  const factory ChapterDetailsState.precached(
    ChapterDetailsContent content,
  ) = _precached;
}

@freezed
class ChapterDetailsContent with _$ChapterDetailsContent {
  factory ChapterDetailsContent({
    required String mangaId,
    required ChapterDetails chapterDetails,
    required ChapterList chapterList,
    required List<Chapter> currentChapters,
    required Chapter? nextChapter,
    required Chapter? previousChapter,
  }) = _ChapterDetailsContent;
}
