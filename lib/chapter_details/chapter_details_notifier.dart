import 'dart:async';

import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/chapter/chapter.dart';

final chapterDetailsProvider = StateNotifierProvider.autoDispose<
    ChapterDetailsNotifier, ChapterDetailsState>((ref) {
  return ChapterDetailsNotifier(
    ref.watch(sourceClientProvider),
    ref.watch(favouritesRepositoryProvider),
  );
});

class ChapterDetailsNotifier extends StateNotifier<ChapterDetailsState> {
  final SourceClient _source;

  ChapterDetailsNotifier(
    SourceClient source,
    FavouritesRepository favourites,
  )   : _source = source,
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
          ChapterDetailsContent(
            mangaId: mangaId,
            chapterDetails: details,
            chapterList: chapterList,
            currentChapters: [currentChapter],
            nextChapter: nextChapter,
            previousChapter: previousChapter,
          ),
        );

        return details;
      },
      precached: (content) async {
        if (content.nextChapter != null) {
          currentChapter = content.nextChapter!;

          ChapterDetails newDetails = await _source.getChapterDetails(
            mangaId,
            currentChapter.id,
          );

          Chapter? nextChapter = chapterList.getNextChapter(currentChapter);
          Chapter? previousChapter =
              chapterList.getPreviousChapter(currentChapter);

          ChapterDetails extendedDetails =
              content.chapterDetails.copyWith(pages: [
            ...content.chapterDetails.pages,
            "page-break",
            ...newDetails.pages,
          ]);

          state = ChapterDetailsState.precached(
            ChapterDetailsContent(
              mangaId: mangaId,
              chapterDetails: extendedDetails,
              chapterList: chapterList,
              currentChapters: [
                ...content.currentChapters,
                content.nextChapter!,
              ],
              nextChapter: nextChapter,
              previousChapter: previousChapter,
            ),
          );

          return extendedDetails;
        }

        return content.chapterDetails;
      },
    )!;
    // TODO: get rid of that bang operator....
  }

  Future<void> preloadNextChapter() async {
    state.whenOrNull(
      precached: (content) {
        if (content.nextChapter != null) {
          getChapterDetails(
            content.mangaId,
            content.nextChapter!,
            content.chapterList,
            false,
          );
        }
      },
    );
  }

  Future<void> imagesPrecached() async {
    state.whenOrNull(
      loaded: (content) {
        state = ChapterDetailsState.precached(content);
      },
    );
  }

  Future<void> nextChapter() async {
    await state.whenOrNull(
      precached: (
        content,
      ) async {
        if (content.nextChapter != null) {
          // TODO: find better way to grabbing next chapter
          // await _mangaDetailsNotifier.state.whenOrNull(
          //   loaded: (mangaDetails, chapters, favourite) async {
          //     await getChapterDetails(
          //       content.mangaId,
          //       content.nextChapter!,
          //       content.chapterList,
          //       false,
          //     );

          //     _readerProgress.moveProgress(
          //       pageDetails: PageDetails(content.nextChapter!.chapterNo, 0),
          //       progress: content.chapterDetails.pages.length.toString(),
          //       chapterNumber: content.nextChapter!.chapterNo,
          //       chapter: content.nextChapter,
          //     );
          //   },
          // );
        }
      },
    );
  }

  Future<void> previousChapter() async {
    await state.whenOrNull(
      precached: (content) async {
        if (content.previousChapter != null) {
          // TODO: Handle previous chapter
          // await _mangaDetailsNotifier.state.whenOrNull(
          //   loaded: (mangaDetails, chapters, favourite) async {
          //     await getChapterDetails(
          //       content.mangaId,
          //       content.previousChapter!,
          //       content.chapterList,
          //       false,
          //     );

          //     _readerProgress.moveProgress(
          //       pageDetails: PageDetails(content.previousChapter!.chapterNo, 0),
          //       progress: content.chapterDetails.pages.length.toString(),
          //       chapterNumber: content.previousChapter!.chapterNo,
          //       reversed: true,
          //       chapter: content.previousChapter,
          //     );
          //   },
          // );
        }
      },
    );
  }
}
