part of 'chapter_cubit.dart';

@freezed
class ChapterState with _$ChapterState {
  const factory ChapterState.initial() = _Initial;
  const factory ChapterState.loaded(ChapterList chapters) = _Loaded;
}
