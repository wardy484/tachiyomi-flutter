import 'dart:developer';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/downloads/application/download_service.dart';
import 'package:fluttiyomi/downloads/application/notifications/download_progress_notification.dart';
import 'package:fluttiyomi/favourites/applications/check_for_updates_notification.dart';
import 'package:fluttiyomi/favourites/applications/favourites_updates_service.dart';
import 'package:fluttiyomi/favourites/applications/new_chapters_notification.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/firebase_options.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workmanager/workmanager.dart';

const checkFavouritesForUpdatesTask = "checkFavouritesForUpdatesTask";
const checkFavouriteForUpdatesTask = "checkFavouriteForUpdatesTask";
const downloadChaptersTask = "downloadChaptersTask";
const downloadManyChaptersTask = "downloadManyChaptersTask";
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
    await container.read(sourceServiceProvider).initialiseSources();

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
          inputData['favouriteId'],
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
      case downloadManyChaptersTask:
        log('Work Manger: $task started');

        if (inputData == null) {
          log('Work Manger: $task inputData is null');
          return Future.value(false);
        }

        final downloadIdsString = inputData['downloadIds'] as String;
        final ids =
            downloadIdsString.split(',').map((e) => int.parse(e)).toList();

        await downloadManyChapters(
          container,
          ids,
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

  final List<UpdatedFavourite> updatedFavourites = [];

  log('Work Manger: Got ${favourites.length} favourites');

  CheckForUpdatesNotification? checkForUpdatesNotification;
  checkForUpdatesNotification = CheckForUpdatesNotification();
  final FutureGroup<List<Chapter>> futures = FutureGroup();
  int updated = 0;

  for (int i = 0; i < favourites.length; i++) {
    final chapters = await container
        .read(favouritesUpdateServiceProvider)
        .getLatestChapters(favourites[i]);

    if (chapters.isNotEmpty) {
      updatedFavourites.add(UpdatedFavourite(favourites[i], chapters));
    }

    updated += 1;
    checkForUpdatesNotification.show(updated, favourites.length);
  }

  futures.close();
  await futures.future;

  if (updatedFavourites.isNotEmpty) {
    NewChaptersGroupNotification(updatedFavourites).show();
  }

  await Future.delayed(const Duration(seconds: 2), () {
    checkForUpdatesNotification?.hide();
  });
}

Future<void> checkOneForUpdates(
  ProviderContainer container,
  String favouriteId,
) async {
  final favourite = await container
      .read(favouritesRepositoryProvider)
      .getFavouriteById(favouriteId);

  if (favourite != null) {
    final checkForUpdatesNotification = CheckForUpdatesNotification();

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

  if (downloadId == null) return;

  final download = await downloadService.getDownload(downloadId);

  if (download == null) return;

  log("Work manager: starting download for ${download.mangaId}");

  final source = container.read(sourceContainerProvider).get(download.sourceId);

  await downloadService.processDownload(
    source,
    download,
  );

  log("Work manager: finished download for ${download.mangaId}");
}

Future<void> downloadManyChapters(
  ProviderContainer container,
  List<int?> downloadId,
) async {
  final notification = DownloadProgressNotification()
    ..show(0, downloadId.length);

  final futures = FutureGroup();
  int completed = 0;

  for (int i = 0; i < downloadId.length; i++) {
    final future = downloadChapter(container, downloadId[i]);

    futures.add(future);

    future.then((value) {
      completed += 1;
      notification.show(completed, downloadId.length);
    });
  }

  futures.close();
  await futures.future;
  await notification.hide();
}
