import 'package:flutter/services.dart';
import 'package:fluttiyomi/reader/reader_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 70;

final readerProvider =
    StateNotifierProvider<ReaderNotifier, ReaderState>((ref) {
  return ReaderNotifier();
});

class ReaderNotifier extends StateNotifier<ReaderState> {
  ReaderNotifier() : super(const ReaderState.reading("1", true));

  void moveProgress(String progress) {
    state = state.copyWith(progress: progress);
  }

  void moveProgressForVisibilityInfo(
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

      moveProgress(pageNumber.toString());
    }
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void showAppbar() {
    state = state.copyWith(appbarVisible: true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
