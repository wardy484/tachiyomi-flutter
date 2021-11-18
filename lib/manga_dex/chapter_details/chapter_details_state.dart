part of 'chapter_details_cubit.dart';

@freezed
class ChapterDetailsState with _$ChapterDetailsState {
  const factory ChapterDetailsState.initial() = _Initial;
  const factory ChapterDetailsState.loaded(
    String mangaId,
    ChapterDetails chapterDetails,
    ChapterList chapters,
    int currentIndex,
    bool startFromEnd,
  ) = _Loaded;
}
