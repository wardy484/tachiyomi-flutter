import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChaptersPage extends ConsumerStatefulWidget {
  final String mangaId;
  final String mangaName;
  final Favourite? favourite;

  const ChaptersPage({
    Key? key,
    required this.mangaId,
    required this.mangaName,
    required this.favourite,
  }) : super(key: key);

  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends ConsumerState<ChaptersPage> {
  late final MangaDetailsNotifier _mangaDetailsNotifier;

  @override
  void initState() {
    super.initState();

    // _refreshController = RefreshController(
    //   initialRefresh: widget.favourite != null,
    // );

    _mangaDetailsNotifier = ref.read(mangaDetailsNotifierProvider.notifier)
      ..getMangaDetails(widget.mangaId, widget.favourite);
  }

  Future<void> _onRefresh() async {
    final completer = Completer<void>();

    if (widget.favourite != null) {
      ref.read(updateQueueProvider.notifier)
        ..addToQueue(widget.mangaName, () async {
          return ref
              .read(favouritesProvider.notifier)
              .getLatestChapters(widget.favourite!);
        })
        ..setOnComplete(() {
          log("Refresh complete");
          completer.complete();
        });
    } else {
      completer.complete();
    }

    await completer.future;
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
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: FirestoreQueryBuilder<Chapter>(
                    query: ref
                        .read(readChaptersRepositoryProvider)
                        .getChaptersQuery(
                          ref.read(sourceClientProvider).sourceId,
                          widget.mangaId,
                        ),
                    pageSize: 200,
                    builder: (context, snapshot, _) {
                      if (snapshot.isFetching) {
                        return const FullPageLoadingIndicator();
                      }

                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                        ),
                        itemCount: snapshot.docs.length + 1,
                        itemBuilder: (context, index) {
                          if (snapshot.hasMore &&
                              index + 2 == snapshot.docs.length) {
                            snapshot.fetchMore();
                          }

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
                                    resumeFrom: lastRead.nextPage,
                                  ),
                                );
                              },
                            );
                          }

                          final chapter = snapshot.docs[index - 1].data();

                          return GestureDetector(
                            onLongPress: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    alignment: Alignment.bottomCenter,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            iconSize: 40,
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      mangaDetailsNotifierProvider
                                                          .notifier)
                                                  .markAsRead(
                                                    chapter.id,
                                                    widget.mangaId,
                                                  );
                                            },
                                            icon: const Icon(Icons.check),
                                          ),
                                          const SizedBox(
                                            width: 35,
                                            height: 30,
                                          ),
                                          IconButton(
                                            iconSize: 40,
                                            onPressed: () async {
                                              final chapters = await ref
                                                  .read(
                                                      readChaptersRepositoryProvider)
                                                  .getChapters(
                                                    ref
                                                        .read(
                                                            sourceClientProvider)
                                                        .src,
                                                    chapter.mangaId,
                                                  );

                                              final chapterIds = chapters
                                                  .toList()
                                                  .where((e) =>
                                                      e.chapterNo <
                                                      chapter.chapterNo)
                                                  .map((chapter) => chapter.id)
                                                  .toList();
                                              ref
                                                  .read(
                                                      mangaDetailsNotifierProvider
                                                          .notifier)
                                                  .markManyAsRead(
                                                    widget.mangaId,
                                                    chapterIds,
                                                  );

                                              ref
                                                  .read(favouritesProvider
                                                      .notifier)
                                                  .markManyAsOpened(
                                                      widget.mangaId,
                                                      chapterIds);
                                            },
                                            icon: const Icon(Icons
                                                .file_download_done_rounded),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ChapterListItem(
                              chapter: chapter,
                              onTap: () async {
                                await AutoRouter.of(context).push(
                                  ReadRoute(
                                    mangaId: widget.mangaId,
                                    chapter: chapter,
                                    chapters: chapters,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
      ),
    );
  }

  @override
  void dispose() {
    _mangaDetailsNotifier.closeStream();

    super.dispose();
  }
}
