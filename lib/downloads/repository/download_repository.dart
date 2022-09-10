import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:isar/isar.dart';

final downloadRepositoryProvider = Provider<DownloadRepository>((ref) {
  return DownloadRepository(
    db: ref.read(isarDatabaseProvider).isar,
  );
});

class DownloadRepository {
  final Isar db;

  DownloadRepository({
    required this.db,
  });

  Future<List<Download>> getAll() async {
    return await db.downloads.where().findAll();
  }

  Future<void> add(Download download) async {
    await db.writeTxn((_) async {
      await db.downloads.put(download);
    });
  }

  Future<void> update(Download download) async {
    await db.writeTxn((_) async {
      await db.downloads.put(download, replaceOnConflict: true);
    });
  }

  // Future<void> delete()
}
