import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_state.dart';
part 'chapter_cubit.freezed.dart';

class ChapterCubit extends Cubit<ChapterState> {
  final SourceClient _source;
  final MyDatabase _database;

  ChapterCubit(SourceClient source, MyDatabase database)
      : _source = source,
        _database = database,
        super(const ChapterState.initial());

  Future<void> getChapters(String mangaId) async {
    ChapterList chapters = await _source.getChapters(mangaId);
    List<CompletedChapter> read = await _database.getRead(_source.src, mangaId);

    chapters = chapters.copyWith(
      chapters: chapters.chapters
          .map(
            (chapter) => chapter.copyWith(
              read: read.firstWhereOrNull((e) => e.chapterId == chapter.id) !=
                  null,
            ),
          )
          .toList(),
    );

    emit(ChapterState.loaded(chapters));
  }
}
