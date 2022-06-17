import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/home/home_notifier.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
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
    return ref.watch(homeProvider).when(
          initial: () => const FullPageLoadingIndicator(),
          loaded: (results) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  var section = results[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          section.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.separated(
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 18),
                          scrollDirection: Axis.horizontal,
                          itemCount: section.items?.length ?? 0,
                          itemBuilder: (context, index) {
                            var manga = section.items![index];

                            Favourite? favourite = ref
                                .read(favouritesProvider.notifier)
                                .getFavouriteByMangaId(manga.id);

                            return SizedBox(
                              width: 170,
                              child: MangaCard(
                                mangaId: manga.id,
                                name: manga.title.text,
                                image: manga.image,
                                favourite: favourite,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            );
          },
        );
  }
}
