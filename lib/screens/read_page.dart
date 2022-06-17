import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_notifier.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_state.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/events/event_definitions.dart';
import 'package:fluttiyomi/events/event_manager.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
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

class ReadPage extends ConsumerStatefulWidget {
  final String mangaId;
  final Chapter chapter;
  final ChapterList chapters;
  final int? resumeFrom;

  const ReadPage({
    Key? key,
    required this.mangaId,
    required this.chapter,
    required this.chapters,
    this.resumeFrom,
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
        loaded: (_, chapterDetails, __, ___, ____) =>
            preloadImages(chapterDetails.pages),
        precached: (_, chapterDetails, __, ___, ____) {
          ref.read(eventsProvider).emit(
                ChapterOpened(chapterDetails),
              );
        },
      );
    });

    return ref.watch(chapterDetailsProvider).when(
          initial: () => ReaderLoadingContent(chapter: widget.chapter),
          loaded: (mangaId, chapterDetails, __, ___, ____) {
            return ReaderLoadingContent(chapter: widget.chapter);
          },
          precached: (
            mangaId,
            chapterDetails,
            currentChapter,
            nextChapter,
            previousChapter,
          ) {
            Chapter chapter = widget.chapter;

            var pages = chapterDetails.pages;
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
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _autoScrollController,
                        padding: ref.watch(settingsProvider).when(
                              initial: () => EdgeInsets.zero,
                              loaded: (settings) => EdgeInsets.symmetric(
                                horizontal: settings.padding.toDouble(),
                              ),
                            ),
                        shrinkWrap: true,
                        reverse: readState.reversed,
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          var item = pages[index];

                          return AutoScrollTag(
                            key: ValueKey(index),
                            index: index,
                            controller: _autoScrollController,
                            child: VisibilityDetector(
                              key: Key("Page-${index + 1}"),
                              child: MangaPage(imagePath: item),
                              onVisibilityChanged: (visibilityInfo) {
                                // App crashes without this, seems to get called after popping screen off
                                // of stack.
                                if (visibilityInfo.visibleFraction == 0) {
                                  return;
                                }

                                int pageNumber = ref
                                    .read(readerProvider.notifier)
                                    .moveProgressForVisibilityInfo(
                                      visibilityInfo,
                                      pages.length,
                                      readState.reversed,
                                    );

                                ref
                                    .read(readChaptersRepositoryProvider)
                                    .setLastPage(
                                      ref.read(sourceClientProvider).sourceId,
                                      mangaId,
                                      widget.chapter.id,
                                      pageNumber,
                                    );
                              },
                            ),
                          );
                        },
                      ),
                      nextChapter: nextChapter,
                      previousChapter: previousChapter,
                    ),
                  ),
                ),
                bottomNavigationBar: ReaderBottomAppBar(
                  numberOfPages: chapterDetails.pages.length,
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
}
