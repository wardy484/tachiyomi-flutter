import 'package:fluttiyomi/database/chapter.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final readChaptersRepositoryProvider = Provider((ref) {
  return ReadChaptersRepository(
    chapters: ref.watch(isarDatabaseProvider).chapters,
    database: ref.watch(isarDatabaseProvider).isar,
  );
});

class ReadChaptersRepository {
  final IsarCollection<Chapter> _chapters;
  final Isar _database;

  ReadChaptersRepository({
    required IsarCollection<Chapter> chapters,
    required Isar database,
  })  : _chapters = chapters,
        _database = database;

  Future<void> markAsRead(
    String sourceId,
    String chapterId,
    String mangaId,
  ) async {
    Chapter? chapter = await _getChapter(sourceId, mangaId, chapterId);

    // TODO: What should I do with mangas you have no favourited?
    // perhaps build up a cache of mangas you've opened up previously
    if (chapter == null) return;

    chapter.read = true;

    await _database.writeTxn((_) async {
      await _chapters.put(chapter);
    });
  }

  Future<void> markManyAsRead(
    String sourceId,
    String mangaId,
    List<String> chapterIds,
  ) async {
    List<Chapter> chapters = [];

    for (var chapterId in chapterIds) {
      Chapter? chapter = await _getChapter(sourceId, mangaId, chapterId);

      if (chapter == null) return;

      chapter.read = true;

      chapters.add(chapter);
    }

    await _database.writeTxn((_) async {
      await _chapters.putAll(chapters);
    });
  }

  Future<void> setLastPage(
    String sourceId,
    String mangaId,
    String chapterId,
    int pageNumber,
  ) async {
    if (pageNumber == 0) {
      return;
    }

    Chapter? chapter = await _getChapter(sourceId, mangaId, chapterId);

    if (chapter == null) return;

    chapter.page = pageNumber;

    await _database.writeTxn((_) async {
      await _chapters.put(chapter);
    });
  }

  Future<Chapter?> _getChapter(
    String sourceId,
    String mangaId,
    String chapterId,
  ) async {
    return await _chapters
        .where()
        .chapterIdSourceIdMangaIdEqualTo(
          chapterId,
          sourceId,
          mangaId,
        )
        .findFirst();
  }
}
