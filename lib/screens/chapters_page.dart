import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/manga_details/widgets/chapter_options.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:fluttiyomi/utilities/firestore_utils.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  late bool _transparentAppbar = true;

  @override
  void initState() {
    super.initState();

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: _transparentAppbar
              ? Colors.transparent
              : Theme.of(context).appBarTheme.backgroundColor,
          elevation:
              _transparentAppbar ? 0 : Theme.of(context).appBarTheme.elevation,
        ),
        body: ref.watch(mangaDetailsNotifierProvider).when(
              initial: () => const FullPageLoadingIndicator(),
              loaded: (manga, chapters, favourite) {
                if (favourite != null) {
                  final documentSize = FireStoreSize()
                      .getFireStoreDocumentSize(favourite.toJson());
                  log("Document size: $documentSize");
                }

                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(55, 0, 0, 0),
                              Colors.transparent
                            ],
                          ).createShader(Rect.fromLTRB(
                              0, 0, rect.width, rect.height - 50));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          manga.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                        ),
                        itemCount: chapters.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return VisibilityDetector(
                              key: const ValueKey("header"),
                              onVisibilityChanged: (visibility) {
                                // Wrapped it try catch because seems to throw exception when navigating away
                                try {
                                  setState(() {
                                    _transparentAppbar =
                                        visibility.visibleFraction > 0.99;
                                  });
                                } catch (e) {
                                  // log(e);
                                }
                              },
                              child: Header(
                                manga: manga,
                                onToggleFavourite: () async {
                                  await ref
                                      .read(
                                          mangaDetailsNotifierProvider.notifier)
                                      .toggleFavourite(
                                        widget.mangaName,
                                        manga,
                                        chapters,
                                      );

                                  await ref
                                      .read(
                                          mangaDetailsNotifierProvider.notifier)
                                      .getMangaDetails(
                                          widget.mangaId, favourite);
                                },
                                onContinuePressed: () async {
                                  LastReadChapter lastRead = await ref
                                      .read(favouritesProvider.notifier)
                                      .getLastReadChapter(widget.mangaId);

                                  var chapter = lastRead.chapter ??
                                      chapters.chapters.last;

                                  await AutoRouter.of(context).push(
                                    ReadRoute(
                                      mangaId: widget.mangaId,
                                      chapter: chapter,
                                      chapters: chapters,
                                      resumeFrom: lastRead.nextPage,
                                      favourite: widget.favourite,
                                    ),
                                  );
                                },
                              ),
                            );
                          }

                          final chapter = chapters.get(index - 1);

                          return GestureDetector(
                            onLongPress: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return ChapterOptions(
                                    favourite: favourite,
                                    chapter: chapter,
                                    chapterList: chapters,
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
                                    favourite: widget.favourite,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
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
