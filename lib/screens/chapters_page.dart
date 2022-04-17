import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChaptersPage extends ConsumerStatefulWidget {
  final String mangaId;
  final String mangaName;

  const ChaptersPage({Key? key, required this.mangaId, required this.mangaName})
      : super(key: key);

  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends ConsumerState<ChaptersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();

    ref
        .read(mangaDetailsNotifierProvider.notifier)
        .getMangaDetails(widget.mangaId);
  }

  void _onRefresh() {
    ref.read(updateQueueProvider.notifier)
      ..addToQueue(widget.mangaName, () async {
        return ref
            .read(favouritesProvider.notifier)
            .getLatestChapters(widget.mangaId);
      })
      ..setOnComplete(() => _refreshController.refreshCompleted());
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      shouldAddCallback: false,
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.mangaName),
        ),
        body: ref.watch(mangaDetailsNotifierProvider).when(
              initial: () => const FullPageLoadingIndicator(),
              loaded: (manga, chapters) {
                return SmartRefresher(
                  header: const ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                    itemCount: chapters.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Header(
                          manga: manga,
                          onToggleFavourite: () {
                            ref
                                .read(mangaDetailsNotifierProvider.notifier)
                                .toggleFavourite(
                                  widget.mangaName,
                                  manga,
                                  chapters,
                                );
                          },
                          onContinuePressed: () async {
                            LastReadChapter lastRead = await ref
                                .read(favouritesProvider.notifier)
                                .getLastReadChapter(widget.mangaId);

                            var chapter =
                                lastRead.chapter ?? chapters.chapters.last;

                            await AutoRouter.of(context).push(
                              ReadRoute(
                                mangaId: widget.mangaId,
                                chapter: chapter,
                                chapters: chapters,
                                currentChapter: chapters.chapters.indexWhere(
                                  (element) => element.id == chapter.id,
                                ),
                                resumeFrom: lastRead.nextPage,
                              ),
                            );

                            await ref
                                .read(mangaDetailsNotifierProvider.notifier)
                                .getMangaDetails(widget.mangaId);
                          },
                        );
                      }

                      var chapter = chapters.get(index - 1);

                      return FocusedMenuHolder(
                        onPressed: () {},
                        menuWidth: 300,
                        menuItems: [
                          FocusedMenuItem(
                            title: const Text(
                              "Mark as read",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailingIcon: const Icon(
                              Icons.book,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              ref
                                  .read(mangaDetailsNotifierProvider.notifier)
                                  .markAsRead(
                                    chapter.id,
                                    widget.mangaId,
                                  );
                            },
                          ),
                          FocusedMenuItem(
                            title: const Text(
                              "Mark all below as read",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailingIcon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              List<String> chapterIds = [];

                              for (var i = index; i < chapters.length; i++) {
                                chapterIds.add(chapters.get(i).id);
                              }

                              ref
                                  .read(mangaDetailsNotifierProvider.notifier)
                                  .markManyAsRead(widget.mangaId, chapterIds);

                              ref
                                  .read(favouritesProvider.notifier)
                                  .markManyAsOpened(widget.mangaId, chapterIds);
                            },
                          ),
                        ],
                        child: ChapterListItem(
                          chapter: chapter,
                          onTap: () async {
                            await AutoRouter.of(context).push(
                              ReadRoute(
                                mangaId: widget.mangaId,
                                chapter: chapter,
                                chapters: chapters,
                                currentChapter: index - 1,
                              ),
                            );

                            await ref
                                .read(mangaDetailsNotifierProvider.notifier)
                                .getMangaDetails(widget.mangaId);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      ),
    );
  }
}
