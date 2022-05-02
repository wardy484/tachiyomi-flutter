import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
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
  final FavouritesRepository _favourites;
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
        _favourites = favourites,
        _mangaDetailsNotifier = mangaDetailsNotifier,
        super(const ChapterDetailsState.initial());

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
  ) async {
    ChapterDetails details = await _source.getChapterDetails(
      mangaId,
      chapterId,
    );

    state = ChapterDetailsState.loaded(mangaId, details);

    return details;
  }

  Future<void> imagesPrecached() async {
    state.whenOrNull(
      loaded: (mangaId, details) {
        state = ChapterDetailsState.precached(mangaId, details);
      },
    );
  }

  Future<void> nextChapter() async {
    await state.whenOrNull(
      precached: (mangaId, chapterDetails) async {
        var currentChapterIndex = _readerProgress.state.currentIndex;
        var newIndex = currentChapterIndex - 1;

        await _mangaDetailsNotifier.state.whenOrNull(
          loaded: (mangaDetails, chapters) async {
            var newChapter = chapters.get(newIndex);
            var currentChapter = chapters.get(currentChapterIndex);

            await getChapterDetails(mangaId, newChapter.id);

            await _readChapters.markAsRead(
              _source.sourceId,
              currentChapter.id,
              mangaId,
            );

            await _favourites.setLastChapterRead(
              _source.sourceId,
              chapterDetails.mangaId,
              newChapter.id,
            );

            _readerProgress.moveProgress(
              progress: "1",
              currentIndex: newIndex,
              chapter: newChapter,
            );
          },
        );
      },
    );
  }

  Future<void> previousChapter() async {
    await state.whenOrNull(
      precached: (mangaId, chapterDetails) async {
        var currentChapterIndex = _readerProgress.state.currentIndex;
        var newIndex = currentChapterIndex + 1;

        await _mangaDetailsNotifier.state.whenOrNull(
          loaded: (mangaDetails, chapters) async {
            var newChapter = chapters.get(newIndex);

            await getChapterDetails(mangaId, newChapter.id);

            _readerProgress.moveProgress(
              progress: chapterDetails.pages.length.toString(),
              currentIndex: newIndex,
              reversed: true,
              chapter: newChapter,
            );
          },
        );
      },
    );
  }

  Chapter getCurrentChapter() {
    return _mangaDetailsNotifier.state.whenOrNull(
      loaded: (mangaDetails, chapters) {
        return chapters.get(_readerProgress.state.currentIndex);
      },
    )!;
  }
}
