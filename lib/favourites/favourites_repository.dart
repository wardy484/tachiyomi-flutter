import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final favouritesRepositoryProvider = Provider((ref) {
  return FavouritesRepository(
    favourites: ref.watch(isarDatabaseProvider).favourites,
    database: ref.watch(isarDatabaseProvider).isar,
  );
});

class FavouritesRepository {
  final IsarCollection<Favourite> _favourites;
  final Isar _database;

  FavouritesRepository({
    required IsarCollection<Favourite> favourites,
    required Isar database,
  })  : _favourites = favourites,
        _database = database;

  Future<List<Favourite>> getFavourites() async {
    return await _favourites.where().findAll();
  }

  Future<bool> isFavourite(String sourceId, String mangaId) async {
    int favouriteCount = await _favourites
        .where()
        .mangaIdSourceIdEqualTo(mangaId, sourceId)
        .count();

    return favouriteCount > 0;
  }

  Future<void> addFavourite(String sourceId, String name, Manga manga) async {
    final newFavourite = Favourite()
      ..mangaId = manga.id
      ..sourceId = sourceId
      ..name = name
      ..image = manga.image;

    await _database.writeTxn((_) async {
      await _favourites.put(newFavourite);
    });
  }

  Future<void> deleteFavourite(String sourceId, Manga manga) async {
    await _database.writeTxn((_) async {
      await _favourites
          .where()
          .mangaIdSourceIdEqualTo(manga.id, sourceId)
          .deleteAll();
    });
  }
}
