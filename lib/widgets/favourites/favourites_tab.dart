import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
import 'package:fluttiyomi/widgets/common/manga_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesTab extends ConsumerStatefulWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends ConsumerState<FavouritesTab> {
  late final FavouritesNotifier _favouritesNotifier;

  @override
  void initState() {
    super.initState();

    _favouritesNotifier = ref.read(favouritesProvider.notifier)
      ..watchFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(favouritesProvider).when(
          initial: () => const FullPageLoadingIndicator(),
          loaded: (results, checkingForUpdates) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MangaGrid(
                onRefresh: () async {
                  ref.read(favouritesProvider.notifier).checkForUpdates();
                },
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Favourite manga = results[index];

                  return MangaCard(
                    mangaId: manga.mangaId,
                    name: manga.name,
                    image: manga.image,
                    newChapterCount:
                        manga.unreadChapterCount ?? manga.newChapterIds.length,
                    favourite: manga,
                  );
                },
              ),
            );
          },
        );
  }

  @override
  void dispose() {
    _favouritesNotifier.closeStream();

    super.dispose();
  }
}
