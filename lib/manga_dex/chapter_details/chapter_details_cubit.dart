import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_dex/reader_progress/reader_progress_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_details_state.dart';
part 'chapter_details_cubit.freezed.dart';

class ChapterDetailsCubit extends Cubit<ChapterDetailsState> {
  final SourceClient _source;
  final ReaderProgressCubit _readerProgress;
  final MyDatabase _database;

  ChapterDetailsCubit(
    SourceClient source,
    ReaderProgressCubit readerProgress,
    MyDatabase database,
  )   : _source = source,
        _readerProgress = readerProgress,
        _database = database,
        super(const ChapterDetailsState.initial());

  Future<ChapterDetails> getChapterDetails(
    String mangaId,
    String chapterId,
    ChapterList chapters,
    int currentIndex,
    bool startFromEnd,
  ) async {
    emit(const ChapterDetailsState.initial());

    ChapterDetails details = await _source.getChapterDetails(
      mangaId,
      chapterId,
    );

    emit(ChapterDetailsState.loaded(
      mangaId,
      details,
      chapters,
      currentIndex,
      startFromEnd,
    ));

    return details;
  }

  Future<void> nextChapter() async {
    await state.when(
      initial: () {},
      loaded: (
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

        await _database.markAsRead(
          _source.src,
          mangaId,
          currentChapter.id,
        );

        _readerProgress.moveProgress("1");
      },
    );
  }

  Future<void> previousChapter() async {
    await state.when(
      initial: () {},
      loaded: (
        mangaId,
        chapterDetails,
        chapterList,
        currentChapterIndex,
        startFromEnd,
      ) async {
        var newIndex = currentChapterIndex + 1;
        var newChapter = chapterList.get(newIndex);
        var currentChapter = chapterList.get(currentChapterIndex);

        ChapterDetails details = await getChapterDetails(
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
