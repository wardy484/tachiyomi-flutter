import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_notifier.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:fluttiyomi/settings/settings_notifier.dart';
import 'package:fluttiyomi/widgets/manga_page.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_appbar.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_bottom_appbar.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loading_content.dart';
import 'package:fluttiyomi/widgets/manga_reader/scrolling_viewer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'dart:developer' as developer;

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 70;

class ReadPage extends ConsumerStatefulWidget {
  final String mangaId;
  final Chapter chapter;
  final ChapterList chapters;
  final int? resumeFrom;
  final Favourite? favourite;

  const ReadPage({
    Key? key,
    required this.mangaId,
    required this.chapter,
    required this.chapters,
    this.resumeFrom,
    this.favourite,
  }) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends ConsumerState<ReadPage> {
  late Chapter chapter;

  final AutoScrollController _autoScrollController = AutoScrollController();
  final List<ExtendedNetworkImageProvider> _images = [];

  @override
  void initState() {
    super.initState();

    developer.log(
        "Opening reader, id: ${widget.chapter.id}, mangaId: ${widget.mangaId}");

    ref.read(readerProvider.notifier).setChapter(widget.chapter);

    ref.read(settingsProvider.notifier).loadSettings();

    ref.read(chapterDetailsProvider.notifier).getChapterDetails(
          widget.mangaId,
          widget.chapter,
          widget.chapters,
          false,
        );
  }

  tryToScrollToIndex() {
    Future.delayed(const Duration(milliseconds: 20), () {
      // _autoScrollController.scrollToIndex(widget.resumeFrom! - 1);
      // // if the scroller is not properly mounted then the auto scroll will not
      // // scroll there but it also will not error, as such we try at small intervals
      // // until we get scrolling. This seems to be the most efficient way to do it.
      // if (!_autoScrollController.isAutoScrolling) {
      //   tryToScrollToIndex();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chapterDetailsProvider, (previous, ChapterDetailsState next) {
      next.whenOrNull(
        loaded: (content) => preloadImages(content.chapterDetails.pages),
        precached: (content) {
          if (widget.favourite != null &&
              content.currentChapters.length == 1 &&
              content.currentChapters[0].read == false) {
            ref.read(mangaDetailsNotifierProvider.notifier).markAsRead(
                  widget.favourite!,
                  content.currentChapters[0].chapterNo,
                );
          }

          ref.read(readerProvider.notifier).hideAppbar();
        },
      );
    });

    return ref.watch(chapterDetailsProvider).when(
          initial: () => ReaderLoadingContent(chapter: widget.chapter),
          loaded: (content) {
            return ReaderLoadingContent(chapter: widget.chapter);
          },
          precached: (content) {
            Chapter chapter =
                content.currentChapters[content.currentChapters.length - 1];

            var pages = content.chapterDetails.pages;
            var readState = ref.watch(readerProvider);

            if (readState.reversed) {
              pages = pages.reversed.toList();
            }

            return ConditionalWillPopScope(
              shouldAddCallback: false,
              onWillPop: () async => true,
              child: Scaffold(
                extendBodyBehindAppBar: true,
                extendBody: true,
                backgroundColor: Colors.black,
                appBar: ReaderAppBar(chapter: chapter),
                body: GestureDetector(
                  onTap: () {
                    ref.read(readerProvider.notifier).toggleVisibility();
                  },
                  child: ScrollingViewer(
                    child: ReaderLoader(
                      reverse: readState.reversed,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _autoScrollController,
                          padding: ref.watch(settingsProvider).when(
                                initial: () => EdgeInsets.zero,
                                loaded: (settings) => EdgeInsets.symmetric(
                                  horizontal: settings.padding.toDouble(),
                                ),
                              ),
                          reverse: readState.reversed,
                          itemCount: pages.length,
                          itemBuilder: (context, index) {
                            var item = pages[index];

                            if (item == "page-break") {
                              return const SizedBox(height: 100);
                            }

                            return AutoScrollTag(
                              key: ValueKey(index),
                              index: index,
                              controller: _autoScrollController,
                              child: VisibilityDetector(
                                key: Key(
                                  "page:${index + 1}|chapter:${chapter.chapterNo}",
                                ),
                                child: MangaPage(imagePath: item),
                                onVisibilityChanged: (visibilityInfo) {
                                  // App crashes without this, seems to get called after popping screen off
                                  // of stack.
                                  if (visibilityInfo.visibleFraction == 0) {
                                    return;
                                  }

                                  final visiblePercentage =
                                      visibilityInfo.visibleFraction * 100;

                                  if (visiblePercentage <
                                      VISIBILITY_THRESHOLD) {
                                    return;
                                  }

                                  final pageDetails = _parsePageKey(
                                    visibilityInfo.key.toString(),
                                  );

                                  ref.read(readerProvider).when(
                                    reading: (
                                      currentPageDetails,
                                      progress,
                                      appbarVisible,
                                      chapterNumber,
                                      reversed,
                                      currentChapter,
                                    ) {
                                      final progressPercentage =
                                          (pageDetails.pageNumber /
                                                  content.chapterDetails.pages
                                                      .length) *
                                              100;

                                      developer
                                          .log("Progress: $progressPercentage");

                                      if (progressPercentage > 70) {
                                        ref
                                            .read(
                                                chapterDetailsProvider.notifier)
                                            .getChapterDetails(
                                              content.mangaId,
                                              chapter,
                                              content.chapterList,
                                              true,
                                            );
                                      }
                                    },
                                  );

                                  if (widget.favourite != null) {
                                    pageDetails.setFavourite(widget.favourite);
                                  }

                                  ref
                                      .read(readerProvider.notifier)
                                      .updateCurrentPage(
                                        pageDetails,
                                        pages.length,
                                        readState.reversed,
                                        pageDetails.chapterNumber,
                                      );

                                  if (widget.favourite != null) {
                                    // TODO: Maintain state for read and emit last page on exit
                                    // ref
                                    //     .read(readChaptersRepositoryProvider)
                                    //     .setLastPage(
                                    //       widget.favourite!,
                                    //       chapter.id,
                                    //       pageNumber,
                                    //     );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      nextChapter: content.nextChapter,
                      previousChapter: content.previousChapter,
                    ),
                  ),
                ),
                bottomNavigationBar: ReaderBottomAppBar(
                  numberOfPages: content.chapterDetails.pages.length,
                  chapter: chapter,
                ),
              ),
            );
          },
        );
  }

  void preloadImages(List<String> images) async {
    setState(() {
      _images.addAll(
        images.map((page) {
          return ExtendedNetworkImageProvider(
            page,
            cache: true,
          );
        }),
      );
    });

    List<Future> futures = [];

    for (var element in _images) {
      futures.add(precacheImage(element, context));
    }

    await Future.wait(futures);

    ref.read(chapterDetailsProvider.notifier).imagesPrecached();

    if (widget.resumeFrom != null) {
      tryToScrollToIndex();
    }
  }

  _parsePageKey(String pageKey) {
    final parts = pageKey.split("|");
    final pageNumberParts = parts[0].split(":");
    final chapterParts = parts[1].split(":")[1].split("'");
    final chapterNumber = double.parse(chapterParts[0]);
    final pageNumber = int.parse(pageNumberParts[1]);

    return PageDetails(chapterNumber, pageNumber);
  }
}

class PageDetails {
  final double chapterNumber;
  final int pageNumber;
  Favourite? favourite;

  PageDetails(this.chapterNumber, this.pageNumber);

  void setFavourite(Favourite favourite) {
    this.favourite = favourite;
  }
}
