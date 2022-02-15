import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapters/chapters_notifier.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChaptersPage extends ConsumerStatefulWidget {
  final String mangaId;
  final String mangaName;

  const ChaptersPage({Key? key, required this.mangaId, required this.mangaName})
      : super(key: key);

  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends ConsumerState<ChaptersPage> {
  @override
  void initState() {
    super.initState();

    ref
        .read(mangaDetailsNotifierProvider.notifier)
        .getMangaDetails(widget.mangaId);

    ref.read(chaptersNotifierProvider.notifier).getChapters(widget.mangaId);

    // TODO: get real source id
    ref
        .read(favouritesProvider.notifier)
        .markAsOpened("mangaFox", widget.mangaId);
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      shouldAddCallback: false,
      onWillPop: () async {
        ref.read(favouritesProvider.notifier).get();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.mangaName),
        ),
        body: ref.watch(mangaDetailsNotifierProvider).when(
              initial: () => const FullPageLoadingIndicator(),
              loaded: (manga) {
                return ref.watch(chaptersNotifierProvider).when(
                      initial: () => const FullPageLoadingIndicator(),
                      loaded: (results) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                          ),
                          itemCount: results.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Header(
                                manga: manga,
                                onToggleFavourite: () {
                                  ref
                                      .read(
                                          mangaDetailsNotifierProvider.notifier)
                                      .toggleFavourite(widget.mangaName, manga);
                                },
                              );
                            }

                            var chapter = results.get(index - 1);

                            return ChapterListItem(
                              chapter: chapter,
                              onTap: () {
                                AutoRouter.of(context).push(
                                  ReadRoute(
                                    mangaId: widget.mangaId,
                                    chapter: chapter,
                                    chapters: results,
                                    currentChapter: index - 1,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
              },
            ),
      ),
    );
  }
}
