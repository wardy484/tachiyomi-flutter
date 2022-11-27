import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    return await db.downloads.where().sortByCreatedAtDesc().findAll();
  }

  Future<List<Download>> getAllPending() async {
    return await db.downloads
        .filter()
        .statusEqualTo(DownloadStatus.pending)
        .statusEqualTo(DownloadStatus.downloading)
        .findAll();
  }

  Stream watchAll() {
    return db.downloads
        .where()
        .sortByCreatedAtDesc()
        .watch(initialReturn: true);
  }

  Stream watchPending() {
    return db.downloads
        .filter()
        .statusEqualTo(DownloadStatus.pending)
        .watchLazy();
  }

  Future<void> add(Download download) async {
    await db.writeTxn((_) async {
      download.createdAt = DateTime.now();
      download.updatedAt = DateTime.now();
      await db.downloads.put(download);
    });
  }

  Future<void> update(Download download) async {
    await db.writeTxn((_) async {
      download.updatedAt = DateTime.now();
      await db.downloads.put(download, replaceOnConflict: true);
    });
  }

  Future<void> delete(Download download) async {
    await db.writeTxn((_) async {
      await db.downloads.delete(download.id!);
    });
  }
}
