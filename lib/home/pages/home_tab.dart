import 'package:flutter/material.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/home/home_notifier.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
import 'package:fluttiyomi/widgets/common/manga_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  void initState() {
    super.initState();

    ref.read(homeProvider.notifier).load();
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
                    newChapterCount: manga.newChapterIds.length,
                  );
                },
              ),
            );
          },
        );
  }
}
