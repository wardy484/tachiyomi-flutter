import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/chapter/chapter.dart';

final chapterDetailsProvider = StateNotifierProvider.autoDispose<
    ChapterDetailsNotifier, ChapterDetailsState>((ref) {
  return ChapterDetailsNotifier(
    ref.watch(sourceClientProvider),
    ref.watch(readerProvider.notifier),
    ref.watch(readChaptersRepositoryProvider),
    ref.watch(favouritesRepositoryProvider),
    ref.watch(mangaDetailsNotifierProvider.notifier),
  );
});

class ChapterDetailsNotifier extends StateNotifier<ChapterDetailsState> {
  final SourceClient _source;
  final ReaderNotifier _readerProgress;
  final ReadChaptersRepository _readChapters;
  final MangaDetailsNotifier _mangaDetailsNotifier;

  ChapterDetailsNotifier(
    SourceClient source,
    ReaderNotifier readerProgress,
    ReadChaptersRepository readChapters,
    FavouritesRepository favourites,
    MangaDetailsNotifier mangaDetailsNotifier,
  )   : _source = source,
        _readerProgress = readerProgress,
        _readChapters = readChapters,
        _mangaDetailsNotifier = mangaDetailsNotifier,
        super(const ChapterDetailsState.initial());

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    Chapter currentChapter,
  ) async {
    ChapterDetails details = await _source.getChapterDetails(
      mangaId,
      currentChapter.id,
    );

    Chapter? nextChapter = await _readChapters.getNextChapter(
      _source.src,
      mangaId,
      currentChapter.chapterNo,
    );

    Chapter? previousChapter = await _readChapters.getPreviousChapter(
      _source.src,
      mangaId,
      currentChapter.chapterNo,
    );

    state = ChapterDetailsState.loaded(
      mangaId,
      details,
      currentChapter,
      nextChapter,
      previousChapter,
    );

    return details;
  }

  Future<void> imagesPrecached() async {
    state.whenOrNull(
      loaded: (mangaId, details, current, next, previous) {
        state = ChapterDetailsState.precached(
            mangaId, details, current, next, previous);
      },
    );
  }

  Future<void> nextChapter() async {
    await state.whenOrNull(
      precached: (
        mangaId,
        chapterDetails,
        currentChapter,
        nextChapter,
        previousChapter,
      ) async {
        if (nextChapter != null) {
          await _mangaDetailsNotifier.state.whenOrNull(
            loaded: (mangaDetails, chapters) async {
              await getChapterDetails(mangaId, nextChapter);

              _readerProgress.moveProgress(
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
        currentChapter,
        nextChapter,
        previousChapter,
      ) async {
        if (previousChapter != null) {
          await _mangaDetailsNotifier.state.whenOrNull(
            loaded: (mangaDetails, chapters) async {
              await getChapterDetails(mangaId, previousChapter);

              _readerProgress.moveProgress(
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
