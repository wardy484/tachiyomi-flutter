import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/source_data.dart' as source_data;
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/chapter.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/tag.dart';
import 'package:fluttiyomi/database/tag_section.dart';
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
      ..newChapterIds = []
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

    List<Chapter> newChapters = _mapChapters(chapterList.chapters, sourceId);
    List<TagSection> newTagSections = _mapTagSections(manga.tags ?? []);

    newFavourite.chapters.addAll(newChapters);
    newFavourite.tagSections.addAll(newTagSections);

    await _database.writeTxn((_) async {
      await _favourites.put(newFavourite);
      await newFavourite.chapters.save();
      await newFavourite.tagSections.save();
    });
  }

  Future<void> addChapters(
    Favourite favourite,
    List<source_data.Chapter> chapters,
  ) async {
    List<Chapter> newChapters = _mapChapters(
      chapters,
      favourite.sourceId,
    );

    favourite.chapters.addAll(newChapters);

    await _database.writeTxn((_) async {
      await favourite.chapters.save();
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

  Future<void> setLastChapterRead(
    String sourceId,
    String mangaId,
    String chapterId,
  ) async {
    var favourite = await getFavourite(sourceId, mangaId);

    if (favourite == null) return;

    await favourite.chapters.load();

    favourite.lastChapterRead.value = favourite.chapters
        .where(
          (c) => c.chapterId == chapterId,
        )
        .first;

    await _database.writeTxn((isar) async {
      await _favourites.put(favourite);
    });
  }

  List<Chapter> _mapChapters(
    List<source_data.Chapter> chapters,
    String sourceId,
  ) {
    final List<Chapter> newChapters = [];

    for (var i = 0; i < chapters.length; i++) {
      final chapter = chapters[i];

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
        ..read = false
        ..page = 1;

      newChapters.add(newChapter);
    }

    return newChapters;
  }

  List<TagSection> _mapTagSections(
    List<source_data.TagSection> tagSections,
  ) {
    final List<TagSection> newTagSectons = [];

    for (var i = 0; i < tagSections.length; i++) {
      final tagSection = tagSections[i];

      final newTagSection = TagSection()
        ..label = tagSection.label
        ..tagSectionId = tagSection.id;

      newTagSectons.add(newTagSection);

      for (var x = 0; x < tagSection.tags.length; x++) {
        final tag = tagSection.tags[x];

        final newTag = Tag()
          ..tagId = tag.id
          ..label = tag.label;

        newTagSection.tags.add(newTag);
      }
    }

    return newTagSectons;
  }

  // Used for debug atm
  Future<void> deleteChapter(Chapter chapter) async {
    await _database.writeTxn((isar) async {
      await _database.chapters
          .where()
          .chapterIdSourceIdMangaIdEqualTo(
              chapter.chapterId, chapter.sourceId, chapter.mangaId)
          .deleteAll();
    });
  }
}
