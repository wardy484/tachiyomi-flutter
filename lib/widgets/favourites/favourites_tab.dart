import 'package:flutter/material.dart';
import 'package:fluttiyomi/database/favourite.dart';
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
  @override
  void initState() {
    super.initState();

    ref.read(favouritesProvider.notifier).get();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(favouritesProvider).when(
          initial: () => const FullPageLoadingIndicator(),
          loaded: (results, checkingForUpdates) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MangaGrid(
                heightMultipler: 1.55,
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Favourite manga = results[index];

                  return MangaCard(
                    mangaId: manga.mangaId,
                    name: manga.name,
                    image: manga.image,
                    showBadge: manga.hasNewChapters,
                  );
                },
              ),
            );
          },
        );
  }
}
