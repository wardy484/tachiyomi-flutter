import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/downloads/data/download_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final downloadRepositoryProvider = Provider<DownloadRepository>((ref) {
  return DownloadRepository(
    db: ref.read(isarDatabaseProvider).isar,
  );
});

final allDownloadsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(downloadRepositoryProvider).watchAll();
});

class DownloadRepository {
  final Isar db;

  DownloadRepository({
    required this.db,
  });

  Future<Download?> get(int id) async {
    return db.downloads.get(id);
  }

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

  Stream<List<Download>> watchAll() {
    return db.downloads
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }

  Stream watchPending() {
    return db.downloads
        .filter()
        .statusEqualTo(DownloadStatus.pending)
        .watchLazy();
  }

  Future<Download> add(Download download) async {
    return await db.writeTxn<Download>(() async {
      download.createdAt = DateTime.now();
      download.updatedAt = DateTime.now();
      await db.downloads.put(download);

      return download;
    });
  }

  Future<void> update(Download download) async {
    await db.writeTxn(() async {
      download.updatedAt = DateTime.now();
      await db.downloads.put(download);
    });
  }

  Future<void> delete(Download download) async {
    await db.writeTxn(() async {
      await db.downloads.delete(download.id!);
    });
  }
}
