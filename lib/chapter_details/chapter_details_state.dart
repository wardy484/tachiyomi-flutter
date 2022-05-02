import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_details_state.freezed.dart';

@freezed
class ChapterDetailsState with _$ChapterDetailsState {
  const factory ChapterDetailsState.initial() = _Initial;
  const factory ChapterDetailsState.loaded(
    String mangaId,
    ChapterDetails chapterDetails,
  ) = _Loaded;

  const factory ChapterDetailsState.precached(
    String mangaId,
    ChapterDetails chapterDetails,
  ) = _precached;
}
