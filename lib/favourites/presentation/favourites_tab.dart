import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/presentation/favourite_card.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_grid.dart';
import 'package:fluttiyomi/work_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workmanager/workmanager.dart';

class FavouritesTab extends HookConsumerWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      _scheduleUpdates(ref);
      return null;
    }, const []);

    return ref.watch(favouritesStreamProvider).when(
          loading: () => const FullPageLoadingIndicator(),
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
          data: (results) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MangaGrid(
                onRefresh: () => _fetchNewChapters(ref),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Favourite favourite = results[index];
                  Source source = ref
                      .watch(sourceContainerProvider)
                      .get(favourite.sourceId);

                  log("Favourite: ${favourite.mangaId}");

                  return FavouriteCard(source: source, favourite: favourite);
                },
              ),
            );
          },
        );
  }

  Future<void> _fetchNewChapters(WidgetRef ref) async {
    final userId = ref.read(authRepositoryProvider).currentUser.id;

    ref.read(workManagerProvider).registerOneOffTask(
          "$checkFavouritesForUpdatesTask-$userId",
          checkFavouritesForUpdatesTask,
          constraints: Constraints(
            networkType: NetworkType.connected,
          ),
          inputData: {
            'userId': userId,
          },
          // ExistingWorkPolicy.keep means that if the task is already running,
          // it will not be restarted and a second will not be started.
          existingWorkPolicy: ExistingWorkPolicy.keep,
        );
  }

  Future<void> _scheduleUpdates(WidgetRef ref) async {
    final userId = ref.read(authRepositoryProvider).currentUser.id;
    final taskName = "$checkFavouritesForUpdatesTask-$userId-recurring";

    // Delete the old task to be sure we don't have duplicates.
    ref.read(workManagerProvider).cancelByUniqueName(taskName);

    ref.read(workManagerProvider).registerPeriodicTask(
          "$checkFavouritesForUpdatesTask-$userId-recurring",
          taskName,
          frequency: const Duration(hours: 2),
          constraints: Constraints(
            networkType: NetworkType.connected,
          ),
          inputData: {
            'userId': userId,
          },

          // ExistingWorkPolicy.keep means that if the task is already running,
          // it will not be restarted and a second will not be started.
          existingWorkPolicy: ExistingWorkPolicy.keep,
        );
  }
}
