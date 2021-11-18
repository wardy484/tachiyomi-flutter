import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_details_state.dart';
part 'manga_details_cubit.freezed.dart';

class MangaDetailsCubit extends Cubit<MangaDetailsState> {
  final SourceClient _source;

  MangaDetailsCubit(SourceClient source)
      : _source = source,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(String mangaId) async {
    Manga details = await _source.getMangaDetails(mangaId);

    emit(MangaDetailsState.loaded(details));
  }
}
