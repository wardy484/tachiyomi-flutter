import 'package:flutter/services.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/reader_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 70;

final readerProvider =
    StateNotifierProvider.autoDispose<ReaderNotifier, ReaderState>((ref) {
  return ReaderNotifier(
    chapters: ref.watch(readChaptersRepositoryProvider),
  );
});

class ReaderNotifier extends StateNotifier<ReaderState> {
  final ReadChaptersRepository chapters;

  ReaderNotifier({
    required this.chapters,
  }) : super(const ReaderState.reading(
          progress: "1",
          appbarVisible: true,
          currentIndex: 0,
          reversed: false,
        ));

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void moveProgress({
    required String progress,
    int? currentIndex,
    bool reversed = false,
    Chapter? chapter,
  }) {
    state = state.copyWith(
      progress: progress,
      currentIndex: currentIndex ?? state.currentIndex,
      reversed: false,
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
        currentIndex: state.currentIndex,
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
