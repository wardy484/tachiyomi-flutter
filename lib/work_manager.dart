import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/downloads/application/download_service.dart';
import 'package:fluttiyomi/downloads/application/notifications/download_progress_notification.dart';
import 'package:fluttiyomi/downloads/data/download_repository.dart';
import 'package:fluttiyomi/favourites/applications/check_for_updates_notification.dart';
import 'package:fluttiyomi/favourites/applications/favourites_updates_service.dart';
import 'package:fluttiyomi/favourites/applications/new_chapters_notification.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/firebase_options.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workmanager/workmanager.dart';

const checkFavouritesForUpdatesTask = "checkFavouritesForUpdatesTask";
const checkFavouriteForUpdatesTask = "checkFavouriteForUpdatesTask";
const downloadChaptersTask = "downloadChaptersTask";
final workManagerProvider = Provider((ref) => Workmanager());

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    final container = ProviderContainer();
    await container.read(isarDatabaseProvider).init();

    switch (task) {
      case checkFavouritesForUpdatesTask:
        log('Work Manger: $task started');

        if (inputData == null) {
          log('Work Manger: $task inputData is null');
          return Future.value(false);
        }

        await checkFavouritesForUpdates(container, inputData['userId']);

        return Future.value(true);
      case checkFavouriteForUpdatesTask:
        log('Work Manger: $task started');

        if (inputData == null) {
          log('Work Manger: $task inputData is null');
          return Future.value(false);
        }

        await checkOneForUpdates(
          container,
          inputData['userId'],
          inputData['mangaId'],
        );

        return Future.value(true);
      case downloadChaptersTask:
        log('Work Manger: $task started');

        if (inputData == null) {
          log('Work Manger: $task inputData is null');
          return Future.value(false);
        }

        await downloadChapter(
          container,
          inputData['downloadId'],
        );

        return Future.value(true);
    }
    return Future.value(true);
  });
}

Future<void> checkFavouritesForUpdates(
  ProviderContainer container,
  String userId,
) async {
  final favourites =
      await container.read(favouritesRepositoryProvider).getFavourites(userId);

  log('Work Manger: Got ${favourites.length} favourites');

  CheckForUpdatesNotification? checkForUpdatesNotification;

  for (int i = 0; i < favourites.length; i++) {
    checkForUpdatesNotification = CheckForUpdatesNotification(favourites[0]);
    checkForUpdatesNotification.show(i, favourites.length);

    // TODO: Show more useful notifications like tachiyomi:
    // .e.g. On completion of updates, if a chapter updates, show a notification
    // with the manga name and the chapter number(s) that are new.
    //
    // The Undefeatable Swordsman
    // Chapters 147, 148
    final newChapters = await container
        .read(favouritesUpdateServiceProvider)
        .getLatestChapters(favourites[i]);

    if (newChapters.isNotEmpty) {
      NewChaptersNotification(favourites[i], newChapters).show();
    }

    checkForUpdatesNotification.show(i + 1, favourites.length);
  }

  await Future.delayed(const Duration(seconds: 2), () {
    checkForUpdatesNotification?.hide();
  });
}

Future<void> checkOneForUpdates(
  ProviderContainer container,
  String userId,
  String mangaId,
) async {
  final sourceId = await container.read(sourceClientProvider).sourceId;
  final favourite =
      await container.read(favouritesRepositoryProvider).getFavourite(
            userId,
            sourceId,
            mangaId,
          );

  if (favourite != null) {
    final checkForUpdatesNotification = CheckForUpdatesNotification(favourite);

    log('Work Manger: Got ${favourite.name}');

    checkForUpdatesNotification.show(0, 1);

    final newChapters = await container
        .read(favouritesUpdateServiceProvider)
        .getLatestChapters(favourite);

    if (newChapters.isNotEmpty) {
      NewChaptersNotification(favourite, newChapters).show();
    }

    checkForUpdatesNotification.show(1, 1);

    await Future.delayed(const Duration(seconds: 2), () {
      checkForUpdatesNotification.hide();
    });
  }
}

Future<void> downloadChapter(
  ProviderContainer container,
  int? downloadId,
) async {
  final downloadService = container.read(downloadServiceProvider);
  final downloadRepository = container.read(downloadRepositoryProvider);

  if (downloadId == null) return;

  final download = await downloadRepository.get(downloadId);

  if (download == null) return;

  log("Work manager: starting download for ${download.mangaId}");

  final notification = DownloadProgressNotification(download)..show(0, 0);

  await downloadService.processDownload(
    download,
    onProgress: (index, total) {
      notification.show(index, total);
    },
  );

  await Future.delayed(const Duration(seconds: 2));
  await notification.hide();

  log("Work manager: finished download for ${download.mangaId}");
}
