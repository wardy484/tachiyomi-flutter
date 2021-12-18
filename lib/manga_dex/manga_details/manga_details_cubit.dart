import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_details_state.dart';
part 'manga_details_cubit.freezed.dart';

class MangaDetailsCubit extends Cubit<MangaDetailsState> {
  final SourceClient _source;
  final MyDatabase _database;

  MangaDetailsCubit(SourceClient source, MyDatabase database)
      : _source = source,
        _database = database,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(String mangaId) async {
    Manga details = await _source.getMangaDetails(mangaId);
    details = details.copyWith(
      favourite: await _database.isFavourite(_source.src, mangaId),
    );

    emit(MangaDetailsState.loaded(details));
  }

  Future<void> toggleFavourite(String mangaName, Manga manga) async {
    if (!manga.favourite) {
      await _database.addFavourite(_source.src, mangaName, manga);
    } else {
      await _database.deleteFavourite(_source.src, manga);
    }

    emit(MangaDetailsState.loaded(manga.copyWith(
      favourite: !manga.favourite,
    )));
  }
}
