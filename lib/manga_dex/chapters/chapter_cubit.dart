import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_state.dart';
part 'chapter_cubit.freezed.dart';

class ChapterCubit extends Cubit<ChapterState> {
  final SourceClient _source;

  ChapterCubit(SourceClient source)
      : _source = source,
        super(const ChapterState.initial());

  Future<void> getChapters(String mangaId) async {
    ChapterList chapters = await _source.getChapters(mangaId);

    emit(ChapterState.loaded(chapters));
  }
}
