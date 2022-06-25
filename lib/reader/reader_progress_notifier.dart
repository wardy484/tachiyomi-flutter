import 'package:flutter/services.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:fluttiyomi/reader/reader_state.dart';
import 'package:fluttiyomi/screens/read_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final readerProvider =
    StateNotifierProvider.autoDispose<ReaderNotifier, ReaderState>((ref) {
  return ReaderNotifier(
    favourites: ref.read(favouritesRepositoryProvider),
    auth: ref.read(authRepositoryProvider),
  );
});

class ReaderNotifier extends StateNotifier<ReaderState> {
  final FavouritesRepository favourites;
  final AuthRepository auth;

  ReaderNotifier({
    required this.favourites,
    required this.auth,
  }) : super(ReaderState.reading(
          currentPage: PageDetails(0, 0),
          progress: "0",
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
    required PageDetails pageDetails,
    required String progress,
    double? chapterNumber,
    bool reversed = false,
    Chapter? chapter,
  }) {
    state = state.copyWith(
      currentPage: pageDetails,
      progress: progress,
      chapterNumber: chapterNumber ?? state.chapterNumber,
      reversed: reversed,
      currentChapter: chapter ?? state.currentChapter,
    );
  }

  int updateCurrentPage(
    PageDetails pageDetails,
    int maxPages,
    bool reversed,
    double chapterNumber,
  ) {
    int pageNumber = pageDetails.pageNumber;

    if (reversed) {
      pageNumber = maxPages - (pageNumber - 1);
    }

    if (chapterNumber != state.chapterNumber) {
      final Favourite? favourite = pageDetails.favourite;
      final Chapter? chapter = pageDetails.favourite?.getChapter(chapterNumber);

      if (favourite != null && chapter != null && chapter.read == false) {
        favourites.markAsRead(
          auth.getCurrentUser(),
          favourite,
          [chapterNumber],
        );
      }
    }

    moveProgress(
      pageDetails: pageDetails,
      progress: pageNumber.toString(),
      chapterNumber: state.chapterNumber,
    );

    return pageNumber;
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
