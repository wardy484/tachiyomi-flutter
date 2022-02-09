import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/read_chapter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final readChaptersRepositoryProvider = Provider((ref) {
  return ReadChaptersRepository(
    readChapters: ref.watch(isarDatabaseProvider).readChapters,
    database: ref.watch(isarDatabaseProvider).isar,
  );
});

class ReadChaptersRepository {
  final IsarCollection<ReadChapter> _readChapters;
  final Isar _database;

  ReadChaptersRepository({
    required IsarCollection<ReadChapter> readChapters,
    required Isar database,
  })  : _readChapters = readChapters,
        _database = database;

  Future<List<ReadChapter>> getRead(String sourceId, String mangaId) async {
    return await _readChapters
        .where()
        .mangaIdSourceIdEqualTo(mangaId, sourceId)
        .findAll();
  }

  Future<void> markAsRead(
    String sourceId,
    String chapterId,
    String mangaId,
  ) async {
    final newReadChapter = ReadChapter()
      ..mangaId = mangaId
      ..sourceId = sourceId
      ..chapterId = chapterId;

    await _database.writeTxn((_) async {
      await _readChapters.put(newReadChapter);
    });
  }
}
