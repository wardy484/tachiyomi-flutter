import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/presentation/favourite_card.dart';
import 'package:fluttiyomi/favourites/presentation/favourite_updates_controller.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesTab extends ConsumerWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(favouritesStreamProvider).when(
          loading: () => const FullPageLoadingIndicator(),
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
          data: (results) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MangaGrid(
                onRefresh: () async {
                  ref
                      .read(favouriteUpdateQueueControllerProvider.notifier)
                      .addManyToQueue(results);
                },
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Favourite favourite = results[index];

                  return FavouriteCard(favourite: favourite);
                },
              ),
            );
          },
        );
  }
}
