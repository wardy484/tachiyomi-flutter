import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chapterDetailsProvider = StateNotifierProvider.autoDispose<
    ChapterDetailsNotifier, ChapterDetailsState>((ref) {
  return ChapterDetailsNotifier(
    ref.watch(sourceClientProvider),
    ref.watch(readerProvider.notifier),
    ref.watch(readChaptersRepositoryProvider),
    ref.watch(favouritesRepositoryProvider),
  );
});

class ChapterDetailsNotifier extends StateNotifier<ChapterDetailsState> {
  final SourceClient _source;
  final ReaderNotifier _readerProgress;
  final ReadChaptersRepository _readChapters;
  final FavouritesRepository _favourites;

  ChapterDetailsNotifier(
    SourceClient source,
    ReaderNotifier readerProgress,
    ReadChaptersRepository readChapters,
    FavouritesRepository favourites,
  )   : _source = source,
        _readerProgress = readerProgress,
        _readChapters = readChapters,
        _favourites = favourites,
        super(const ChapterDetailsState.initial());

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
    ChapterList chapters,
    int currentIndex,
    bool startFromEnd,
  ) async {
    ChapterDetails details = await _source.getChapterDetails(
      mangaId,
      chapterId,
    );

    state = ChapterDetailsState.loaded(
      mangaId,
      details,
      chapters,
      currentIndex,
      startFromEnd,
    );

    return details;
  }

  Future<void> imagesPrecached() async {
    state.whenOrNull(
      loaded: (mangaId, details, chapters, currentIndex, startFromEnd) {
        state = ChapterDetailsState.precached(
          mangaId,
          details,
          chapters,
          currentIndex,
          startFromEnd,
        );
      },
    );
  }

  Future<void> nextChapter() async {
    await state.whenOrNull(
      precached: (
        mangaId,
        chapterDetails,
        chapterList,
        currentChapterIndex,
        startFromEnd,
      ) async {
        var newIndex = currentChapterIndex - 1;
        var newChapter = chapterList.get(newIndex);
        var currentChapter = chapterList.get(currentChapterIndex);

        await getChapterDetails(
          mangaId,
          newChapter.id,
          chapterList,
          newIndex,
          false,
        );

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

        _readerProgress.moveProgress("1");
      },
    );
  }

  Future<void> previousChapter() async {
    await state.whenOrNull(
      precached: (
        mangaId,
        chapterDetails,
        chapterList,
        currentChapterIndex,
        startFromEnd,
      ) async {
        var newIndex = currentChapterIndex + 1;
        var newChapter = chapterList.get(newIndex);
        chapterList.get(currentChapterIndex);

        await getChapterDetails(
          mangaId,
          newChapter.id,
          chapterList,
          newIndex,
          true,
        );

        _readerProgress.moveProgress(chapterDetails.pages.length.toString());
      },
    );
  }
}
