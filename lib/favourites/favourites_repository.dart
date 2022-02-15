import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/chapter.dart';
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

  Future<Favourite?> getFavourite(String sourceId, String mangaId) async {
    return await _favourites
        .where()
        .mangaIdSourceIdEqualTo(mangaId, sourceId)
        .findFirst();
  }

  Future<void> addFavourite(
    String sourceId,
    String name,
    Manga manga,
    ChapterList chapterList,
  ) async {
    final newFavourite = Favourite()
      ..mangaId = manga.id
      ..sourceId = sourceId
      ..name = name
      ..image = manga.image
      ..hasNewChapters = false
      ..titles = manga.titles
      ..rating = manga.rating
      ..mangaStatus = manga.mangaStatus
      ..langFlag = manga.langFlag
      ..author = manga.author
      ..artist = manga.artist
      ..covers = manga.covers
      ..desc = manga.desc
      ..follows = manga.follows
      ..lastUpdate = manga.lastUpdate;

    final List<Chapter> newChapters = [];

    for (var i = 0; i < chapterList.chapters.length; i++) {
      final chapter = chapterList.chapters[i];

      final newChapter = Chapter()
        ..sourceId = sourceId
        ..chapterId = chapter.id
        ..mangaId = chapter.mangaId
        ..chapterNo = chapter.chapterNo
        ..langCode = chapter.langCode
        ..name = chapter.name
        ..volume = chapter.volume
        ..group = chapter.group
        ..time = chapter.time
        ..read = false;

      newChapters.add(newChapter);
    }

    newFavourite.chapters.addAll(newChapters);

    await _database.writeTxn((_) async {
      await _favourites.put(newFavourite);
      await newFavourite.chapters.save();
    });
  }

  Future<void> update(List<Favourite> favourites) async {
    await _database.writeTxn((_) async {
      _favourites.putAll(favourites);
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
