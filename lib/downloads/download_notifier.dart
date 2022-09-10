import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/downloads/download_state.dart';
import 'package:fluttiyomi/downloads/models/download.dart';
import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:fluttiyomi/downloads/repository/download_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';

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

  void addDownload(Manga manga, Chapter chapter) async {
    final download = Download(
      manga: manga,
      chapter: chapter,
      status: DownloadStatus.pending,
    );

    state = DownloadState.download(
      downloads: [...state.downloads, download],
    );

    if (state.isolate == null) {
      log('Starting isolate');
      await _startIsolate();
      log('Isolate started');
    }

    if (state.sendPort != null) {
      log('Sending download to isolate');
      state.sendPort?.send(jsonEncode(download.toJson()));
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

        if (state.downloads.isNotEmpty) {
          for (final download in state.downloads) {
            log("Sending download to isolate");
            state.sendPort?.send(jsonEncode(download.toJson()));
          }
        }
      }

      if (message is String) {
        // Then message is probably a download... I think
        final json = jsonDecode(message);
        final updatedDownload = Download.fromJson(json);
        log("Got a download back from isolate: ${updatedDownload.chapter.id} ${updatedDownload.status}");
        final downloads = state.downloads.map((download) {
          if (download.chapter.id != updatedDownload.chapter.id) {
            return download;
          }

          return updatedDownload;
        });

        // TODO: do implement page based progress counter
        // Add progress to DownloadState
        // Upon Receiving page count set it to that
        // every time a Page is loaded increment counter
        // the we can have a pretty loading bar

        // TODO: Sometimes status hangs are "pendning" even though it's not
        // actually pending

        state = DownloadState.download(
          downloads: downloads.toList(),
          isolate: isolate,
        );
      }
    });
  }
}

class IsolateModel {
  final List<Download> chapters;
  final SendPort sendPort;

  IsolateModel(this.chapters, this.sendPort);
}

processDownloadQueue(SendPort sendPort) async {
  final source = await SourceClient.init();

  ReceivePort receivePort = ReceivePort();

  log("Sending receive port to main isolate");
  sendPort.send(receivePort.sendPort);

  await for (var message in receivePort) {
    if (message is String) {
      // Then message is probably a download... I think
      final json = jsonDecode(message);
      final download = Download.fromJson(json);

      log("Received download ${download.manga.titles[0]}: ${download.chapter.id}");

      log("Sending download back to main isolate");
      // log("Should be senidng back to main isolate as downloading");
      sendPort.send(
        jsonEncode(download.copyWith(status: DownloadStatus.downloading)),
      );

      final chapter = download.chapter;

      log("Downloading chapter ${chapter.chapterNo}");

      final details =
          await source.getChapterDetails(chapter.mangaId, chapter.id);

      List<ExtendedNetworkImageProvider> images = details.pages.map((page) {
        return ExtendedNetworkImageProvider(
          page,
          cache: true,
        );
      }).toList();

      List<Future> futures = [];

      for (var image in images) {
        var stream = image.resolve(const ImageConfiguration());
        var completer = Completer();

        stream.addListener(
          ImageStreamListener((image, synchronousCall) {
            completer.complete();
          }),
        );

        futures.add(completer.future);
      }

      await Future.wait(futures);
      log("Downloaded chapter ${chapter.chapterNo}");

      log("Sending download back to main isolate as complete");
      sendPort.send(
        jsonEncode(download.copyWith(status: DownloadStatus.complete).toJson()),
      );
      // log("Should be senidng back to main isolate as downloaded");
    }
  }
}

// Future startDownload(SourceClient source, Download download) async {
//   final chapter = download.chapter;

//   log("Downloading chapter ${chapter.chapterNo}");

//   final details = await source.getChapterDetails(chapter.mangaId, chapter.id);

//   List<ExtendedNetworkImageProvider> images = details.pages.map((page) {
//     return ExtendedNetworkImageProvider(
//       page,
//       cache: true,
//     );
//   }).toList();

//   List<Future> futures = [];

//   for (var image in images) {
//     var stream = image.resolve(const ImageConfiguration());
//     var completer = Completer();

//     stream.addListener(
//       ImageStreamListener((image, synchronousCall) {
//         completer.complete();
//       }),
//     );

//     futures.add(completer.future);
//   }

//   return Future.wait(futures).then((value) {
//     log("Downloaded chapter ${chapter.chapterNo}");
//   });
// }
