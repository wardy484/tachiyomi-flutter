import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/refresh_icon_button.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart' as data_chapter;

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

    ref.read(favouritesProvider.notifier).markAsOpened(widget.mangaId);
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
          actions: [
            RefreshIconButton(
              onPressed: () async {
                await ref
                    .read(favouritesProvider.notifier)
                    .getLatestChapters(widget.mangaId);
              },
              alertMessage: "Checking for new chapters!",
            ),
          ],
        ),
        body: ref.watch(mangaDetailsNotifierProvider).when(
              initial: () => const FullPageLoadingIndicator(),
              loaded: (manga, chapters) {
                return ListView.separated(
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
                          var sourceId =
                              ref.read(sourceClientProvider).sourceId;

                          var favourite = await ref
                              .read(favouritesRepositoryProvider)
                              .getFavourite(sourceId, widget.mangaId);

                          data_chapter.Chapter chapter = await ref
                                  .read(favouritesProvider.notifier)
                                  .getLastReadChapter(widget.mangaId) ??
                              chapters.chapters.last;

                          AutoRouter.of(context).push(
                            ReadRoute(
                              mangaId: widget.mangaId,
                              chapter: chapter,
                              chapters: chapters,
                              currentChapter: chapters.chapters.indexWhere(
                                (element) => element.id == chapter.id,
                              ),
                              resumeFrom:
                                  favourite?.lastChapterRead.value?.page,
                            ),
                          );
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
                            for (var i = index; i < chapters.length; i++) {
                              ref
                                  .read(mangaDetailsNotifierProvider.notifier)
                                  .markAsRead(
                                    chapters.get(i).id,
                                    widget.mangaId,
                                  );
                            }
                          },
                        ),
                      ],
                      child: ChapterListItem(
                        chapter: chapter,
                        onTap: () {
                          AutoRouter.of(context).push(
                            ReadRoute(
                              mangaId: widget.mangaId,
                              chapter: chapter,
                              chapters: chapters,
                              currentChapter: index - 1,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}
