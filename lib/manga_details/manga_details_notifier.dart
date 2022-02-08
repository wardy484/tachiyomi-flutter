import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mangaDetailsNotifierProvider =
    StateNotifierProvider<MangaDetailsNotifier, MangaDetailsState>((ref) {
  return MangaDetailsNotifier(
    ref.read(sourceClientProvider),
    ref.read(databaseProvider),
  );
});

class MangaDetailsNotifier extends StateNotifier<MangaDetailsState> {
  final SourceClient _source;
  final MyDatabase _database;

  MangaDetailsNotifier(SourceClient source, MyDatabase database)
      : _source = source,
        _database = database,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(String mangaId) async {
    Manga details = await _source.getMangaDetails(mangaId);
    details = details.copyWith(
      favourite: await _database.isFavourite(_source.src, mangaId),
    );

    state = MangaDetailsState.loaded(details);
  }

  Future<void> toggleFavourite(String mangaName, Manga manga) async {
    if (!manga.favourite) {
      await _database.addFavourite(_source.src, mangaName, manga);
    } else {
      await _database.deleteFavourite(_source.src, manga);
    }

    state = MangaDetailsState.loaded(manga.copyWith(
      favourite: !manga.favourite,
    ));
  }
}
