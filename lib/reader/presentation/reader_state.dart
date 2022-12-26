import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reader_state.freezed.dart';

@freezed
class ReaderState with _$ReaderState {
  const factory ReaderState.reading({
    required PageDetails currentPage,
    required String progress,
    required double chapterNumber,
    required bool reversed,
    Chapter? currentChapter,
  }) = _Reading;
}
