import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:fluttiyomi/screens/read_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/chapter/chapter.dart';

final chapterDetailsProvider = StateNotifierProvider.autoDispose<
    ChapterDetailsNotifier, ChapterDetailsState>((ref) {
  return ChapterDetailsNotifier(
    ref.watch(sourceClientProvider),
    ref.watch(readerProvider.notifier),
    ref.watch(favouritesRepositoryProvider),
    ref.watch(mangaDetailsNotifierProvider.notifier),
  );
});

class ChapterDetailsNotifier extends StateNotifier<ChapterDetailsState> {
  final SourceClient _source;
  final ReaderNotifier _readerProgress;
  final MangaDetailsNotifier _mangaDetailsNotifier;

  ChapterDetailsNotifier(
    SourceClient source,
    ReaderNotifier readerProgress,
    FavouritesRepository favourites,
    MangaDetailsNotifier mangaDetailsNotifier,
  )   : _source = source,
        _readerProgress = readerProgress,
        _mangaDetailsNotifier = mangaDetailsNotifier,
        super(const ChapterDetailsState.initial());

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    Chapter currentChapter,
    ChapterList chapterList,
    bool append,
  ) async {
    return state.whenOrNull(
      initial: () async {
        ChapterDetails details = await _source.getChapterDetails(
          mangaId,
          currentChapter.id,
        );

        Chapter? nextChapter = chapterList.getNextChapter(currentChapter);
        Chapter? previousChapter =
            chapterList.getPreviousChapter(currentChapter);

        state = ChapterDetailsState.loaded(
          mangaId,
          details,
          chapterList,
          [currentChapter],
          nextChapter,
          previousChapter,
        );

        return details;
      },
      precached:
          (mangaId, details, chapterList, current, next, previous) async {
        if (next != null) {
          currentChapter = next;

          ChapterDetails newDetails = await _source.getChapterDetails(
            mangaId,
            currentChapter.id,
          );

          Chapter? nextChapter = chapterList.getNextChapter(currentChapter);
          Chapter? previousChapter =
              chapterList.getPreviousChapter(currentChapter);

          ChapterDetails extendedDetails = details.copyWith(pages: [
            ...details.pages,
            "page-break",
            ...newDetails.pages,
          ]);

          state = ChapterDetailsState.precached(
            mangaId,
            extendedDetails,
            chapterList,
            [
              ...current,
              next,
            ],
            nextChapter,
            previousChapter,
          );

          return extendedDetails;
        }

        return details;
      },
    )!;
    // TODO: get rid of that bang operator....
  }

  Future<void> preloadNextChapter() async {
    state.whenOrNull(
      precached: (mangaId, details, chapterList, current, next, previous) {
        if (next != null) {
          getChapterDetails(mangaId, next, chapterList, false);
        }
      },
    );
  }

  Future<void> imagesPrecached() async {
    state.whenOrNull(
      loaded: (mangaId, details, chapterList, current, next, previous) {
        state = ChapterDetailsState.precached(
            mangaId, details, chapterList, current, next, previous);
      },
    );
  }

  Future<void> nextChapter() async {
    await state.whenOrNull(
      precached: (
        mangaId,
        chapterDetails,
        chapterList,
        currentChapter,
        nextChapter,
        previousChapter,
      ) async {
        if (nextChapter != null) {
          await _mangaDetailsNotifier.state.whenOrNull(
            loaded: (mangaDetails, chapters, favourite) async {
              await getChapterDetails(
                mangaId,
                nextChapter,
                chapterList,
                false,
              );

              _readerProgress.moveProgress(
                pageDetails: PageDetails(nextChapter.chapterNo, 0),
                progress: chapterDetails.pages.length.toString(),
                chapterNumber: nextChapter.chapterNo,
                chapter: nextChapter,
              );
            },
          );
        }
      },
    );
  }

  Future<void> previousChapter() async {
    await state.whenOrNull(
      precached: (
        mangaId,
        chapterDetails,
        chapterList,
        currentChapter,
        nextChapter,
        previousChapter,
      ) async {
        if (previousChapter != null) {
          await _mangaDetailsNotifier.state.whenOrNull(
            loaded: (mangaDetails, chapters, favourite) async {
              await getChapterDetails(
                  mangaId, previousChapter, chapterList, false);

              _readerProgress.moveProgress(
                pageDetails: PageDetails(previousChapter.chapterNo, 0),
                progress: chapterDetails.pages.length.toString(),
                chapterNumber: previousChapter.chapterNo,
                reversed: true,
                chapter: previousChapter,
              );
            },
          );
        }
      },
    );
  }
}
