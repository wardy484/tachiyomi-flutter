import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/downloads/download_state.dart';
import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:fluttiyomi/downloads/repository/download_repository.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final downloadProvider =
    StateNotifierProvider<DownloadNotifier, DownloadState>((ref) {
  return DownloadNotifier(
    downloads: ref.read(downloadRepositoryProvider),
  );
});

class DownloadNotifier extends StateNotifier<DownloadState> {
  final DownloadRepository downloads;

  DownloadNotifier({
    required this.downloads,
  }) : super(const DownloadState.download(downloads: []));

  void openDownloadStream() {
    downloads.watchAll().listen((event) {
      state = DownloadState.download(downloads: event);
    });
  }

  void downloadNewChapters(Favourite favourite, ChapterList newChaptersList) {
    final manga = favourite.toManga();

    for (var chapter in newChaptersList.chapters) {
      addDownload(manga, chapter);
    }
  }

  void addDownload(Manga manga, Chapter chapter) async {
    log('Adding download for ${manga.titles[0]} - ${chapter.chapterNo}');
    final download = Download()
      ..image = manga.image
      ..mangaName = manga.titles[0]
      ..chapterId = chapter.id
      ..mangaId = manga.id
      ..chapterName = chapter.name ?? chapter.chapterNo.toString();

    await downloads.add(download);
    log('Added download for ${manga.titles[0]} - ${chapter.chapterNo}');

    startDownloadQueue();
  }

  void retryDownload(Download download) async {
    download.status = DownloadStatus.pending;
    await downloads.update(download);
  }

  void deleteDownload(Download download) async {
    await downloads.delete(download);
  }

  void startDownloadQueue() async {
    if (state.isolate == null) {
      log('Starting isolate');
      await _startIsolate();
      log('Isolate started');
    }
  }

  _startIsolate() async {
    ReceivePort receivePort = ReceivePort();

    // TODO: Kill isolate when queue is emptied

    final isolate = await FlutterIsolate.spawn(
      processDownloadQueue,
      receivePort.sendPort,
    );

    state = DownloadState.download(
      downloads: state.downloads,
      isolate: isolate,
    );

    receivePort.listen((message) {
      if (message is SendPort) {
        state = DownloadState.download(
          downloads: state.downloads,
          isolate: state.isolate,
          sendPort: message,
        );
      }
    });
  }
}

processDownload(
  DownloadRepository downloadRepository,
  SourceClient source,
  Download download,
) async {
  log("Received download ${download.mangaName}: ${download.chapterId}");

  log("Updating download status to downloading");
  download.status = DownloadStatus.downloading;
  downloadRepository.update(download);

  try {
    log("Downloading chapter ${download.chapterId}");

    final details = await source.getChapterDetails(
      download.mangaId,
      download.chapterId,
    );

    List<ExtendedNetworkImageProvider> images = details.pages.map((page) {
      return ExtendedNetworkImageProvider(
        page,
        cache: true,
      );
    }).toList();

    // TODO: Update downloader to update DefaultCacheManager
    List<Future> futures = [];

    for (var i = 0; i < images.length; i++) {
      final image = images[i];
      log("Downloading image ${i + 1}/${images.length} for Chapter ${download.chapterName} of ${download.mangaName}");

      var stream = image.resolve(const ImageConfiguration());
      var completer = Completer();

      stream.addListener(
        ImageStreamListener((image, synchronousCall) {
          completer.complete();
        }),
      );

      completer.future.then((value) {
        log("Downloaded image ${i + 1}/${images.length} for Chapter ${download.chapterName} of ${download.mangaName}");
      });

      futures.add(completer.future);
    }

    await Future.wait(futures);

    log("Downloaded chapter ${download.chapterId}");

    log("Updating download status to completed");
    download.status = DownloadStatus.complete;
    downloadRepository.update(download);
    log("Updated download status to completed");
  } catch (e) {
    log("Failed to download chapter ${download.chapterId}");
    log(e.toString());
    log("Updating download status to error");
    download.status = DownloadStatus.error;
    downloadRepository.update(download);
    log("Updated download status to error");
  }
}

processDownloadQueue(SendPort sendPort) async {
  final source = await SourceClient.init();
  final database = Database();
  await database.init();
  final downloadRepository = DownloadRepository(db: database.isar);

  ReceivePort receivePort = ReceivePort();

  log("Sending receive port to main isolate");
  sendPort.send(receivePort.sendPort);

  log("Subscribe to process new / updated pending downloads");
  downloadRepository.watchPending().listen((event) async {
    log("Received new / updated pending downloads");
    if (event is Download) {
      log("Processing download ${event.mangaName}: ${event.chapterId}");
      processDownload(downloadRepository, source, event);
    } else if (event is List<Download>) {
      log("Processing ${event.length} downloads");
      for (var download in event) {
        log("Processing download ${download.mangaName}: ${download.chapterId}");
        processDownload(downloadRepository, source, download);
      }
    }
  });

  log("Processing outstanding downloadings");
  // Grabs "downloading" downloads that were interrupted
  final downloads = await downloadRepository.getAllPending();

  for (var download in downloads) {
    await processDownload(downloadRepository, source, download);
  }
}
