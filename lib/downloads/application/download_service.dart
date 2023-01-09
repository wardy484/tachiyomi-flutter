import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/downloads/data/download_repository.dart';
import 'package:fluttiyomi/downloads/data/download_status.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/work_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workmanager/workmanager.dart';

final downloadServiceProvider = Provider<DownloadService>((ref) {
  return DownloadService(
    downloads: ref.watch(downloadRepositoryProvider),
    source: ref.watch(sourceProvider),
    cacheManager: DefaultCacheManager(),
    workManager: ref.watch(workManagerProvider),
  );
});

class DownloadService {
  final DownloadRepository downloads;
  final Source source;
  final CacheManager cacheManager;
  final Workmanager workManager;

  DownloadService({
    required this.downloads,
    required this.source,
    required this.cacheManager,
    required this.workManager,
  });

  Future<Download> addDownload(Manga manga, Chapter chapter) async {
    log('Adding download for ${manga.titles[0]} - ${chapter.chapterNo}');
    final download = Download()
      ..image = manga.image
      ..mangaName = manga.titles[0]
      ..chapterId = chapter.id
      ..mangaId = manga.id
      ..chapterName = chapter.name ?? chapter.chapterNo.toString();

    return await downloads.add(download);
  }

  Future? _cachePage(String pageUrl) async {
    final file = await cacheManager.getFileFromCache(pageUrl);

    if (file != null) {
      return cacheManager.downloadFile(pageUrl);
    }

    return null;
  }

  // Future cachePages(
  //   List<String> pages, {
  //   Function(int, int)? onProgress,
  // }) async {
  //   for (int i = 0; i < pages.length; i++) {
  //     final page = pages[i];
  //     final future = _cachePage(page);

  //     if (future != null) {
  //       await _cachePage(page);

  //       if (onProgress != null) {
  //         onProgress(i + 1, pages.length);
  //       }
  //     }
  //   }
  // }

  Future cachePages(
    List<String> pages, {
    Function(int, int)? onProgress,
  }) async {
    FutureGroup futures = FutureGroup();

    for (int i = 0; i < pages.length; i++) {
      final page = pages[i];
      final future = _cachePage(page);

      if (future != null) {
        future.then((_) {
          if (onProgress != null) {
            onProgress(i + 1, pages.length);
          }
        });

        futures.add(future);
      }
    }

    futures.close();
    return futures.future;
  }

  Future<void> processDownload(
    Download download, {
    Function(int, int)? onProgress,
  }) async {
    log("Process download: Received download ${download.mangaName}: ${download.chapterId}");

    log("Process download: Updating download status to downloading");
    download.status = DownloadStatus.downloading;
    downloads.update(download);

    try {
      log("Process download: Downloading chapter ${download.chapterId}");
      final chapterDetails = await source.getChapterDetails(
        download.mangaId,
        download.chapterId,
      );

      await cachePages(
        chapterDetails.pages,
        onProgress: (index, total) {
          log("Process download: Downloaded page $index/$total for chapter ${download.chapterId}");
          onProgress?.call(index, total);
        },
      );

      log("Process download: Downloaded chapter ${download.chapterId}");

      log("Process download: Updating download status to completed");
      download.status = DownloadStatus.complete;
      downloads.update(download);
      log("Process download: Updated download status to completed");
    } catch (e) {
      log("Process download: Failed to download chapter ${download.chapterId}");
      log(e.toString());
      log("Process download: Updating download status to error");
      download.status = DownloadStatus.error;
      downloads.update(download);
      log("Process download: Updated download status to error");
    }
  }

  Future<void> downloadChaptersInBackground(
      Manga manga, List<Chapter> chapters) async {
    log("Download chapters in background: Downloading chapters");
    for (final chapter in chapters) {
      final download = await addDownload(manga, chapter);
      fireDownloadInBackground(download);
    }
  }

  void fireDownloadInBackground(Download download) {
    workManager.registerOneOffTask(
      downloadChaptersTask + "-${download..mangaName}-${download.chapterId}",
      downloadChaptersTask,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      inputData: {
        'downloadId': download.id,
      },
      // ExistingWorkPolicy.append means that we will chain additional downloads
      // to run after the currently in progress one
      // definitely slower than running them in parallel but it's a lot easier
      // to reason about and means that we have clear oversight over the
      // downloads that are currently in progress and a nice clean notification
      // log.
      existingWorkPolicy: ExistingWorkPolicy.append,
    );
  }
}
