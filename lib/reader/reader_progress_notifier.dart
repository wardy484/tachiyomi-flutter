import 'package:flutter/services.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/reader_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 70;

final readerProvider =
    StateNotifierProvider.autoDispose<ReaderNotifier, ReaderState>((ref) {
  return ReaderNotifier();
});

class ReaderNotifier extends StateNotifier<ReaderState> {
  ReaderNotifier()
      : super(const ReaderState.reading(
          progress: "1",
          appbarVisible: true,
          chapterNumber: 0,
          reversed: false,
        ));

  void setChapter(Chapter chapter) {
    state = state.copyWith(
      chapterNumber: chapter.chapterNo,
      currentChapter: chapter,
    );
  }

  void moveProgress({
    required String progress,
    double? chapterNumber,
    bool reversed = false,
    Chapter? chapter,
  }) {
    state = state.copyWith(
      progress: progress,
      chapterNumber: chapterNumber ?? state.chapterNumber,
      reversed: reversed,
      currentChapter: chapter ?? state.currentChapter,
    );
  }

  int moveProgressForVisibilityInfo(
    VisibilityInfo visibilityInfo,
    int maxPages,
    bool reversed,
  ) {
    var visiblePercentage = visibilityInfo.visibleFraction * 100;

    if (visiblePercentage > VISIBILITY_THRESHOLD) {
      final indexMatcher = RegExp(r'[0-9]+');
      String progress = indexMatcher
              .firstMatch(
                visibilityInfo.key.toString(),
              )!
              .group(0) ??
          "";

      int pageNumber = int.parse(progress);

      if (reversed) {
        pageNumber = maxPages - (pageNumber - 1);
      }

      moveProgress(
        progress: pageNumber.toString(),
        chapterNumber: state.chapterNumber,
      );

      return pageNumber;
    }

    return 0;
  }

  void toggleVisibility() {
    if (state.appbarVisible) {
      hideAppbar();
    } else {
      showAppbar();
    }
  }

  void hideAppbar() {
    state = state.copyWith(appbarVisible: false);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  void showAppbar() {
    state = state.copyWith(appbarVisible: true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}
