import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/applications/favourites_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_error_content.dart';
import 'package:fluttiyomi/reader/presentation/reader_loading_content.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_bottom_appbar.dart';
import 'package:fluttiyomi/reader/presentation/reader_loader.dart';
import 'package:fluttiyomi/reader/presentation/reader_progress_controller.dart';
import 'package:fluttiyomi/reader/presentation/scrolling_viewer.dart';
import 'package:fluttiyomi/settings/settings_notifier.dart';
import 'package:fluttiyomi/widgets/manga_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 300;

class ReaderPage extends HookConsumerWidget {
  final String mangaId;
  final Chapter chapter;

  const ReaderPage({
    Key? key,
    required this.mangaId,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentChapter = useState(chapter);
    final visibleChapter = useState(chapter);
    final currentPage = useState(1);
    final fetchingMoreResults = useState(false);
    final loadedChapterIds = useState([chapter.id]);
    final markedAsReadIds = useState<List<String>>([]);
    final markingAsRead = useState(false);
    final isReadingInReverse = useState(false);

    useEffect(() {
      ref
          .read(readerPagesControllerProvider(mangaId).notifier)
          .fetchPages(currentChapter.value);

      return null;
    }, []);

    // Not sure why I need this.... its a bit wank I think this is just to trigger
    // the initial read on the page so something subscribs to it.
    ref.listen(readerPagesControllerProvider(mangaId), (state, next) {
      // print("READ PAGE: resetting fetch more results");
      // fetchingMoreResults.value = false;
    });

    return ref.watch(readerLoadingControllerProvider).when(
          loaded: () => WillPopScope(
            onWillPop: () async {
              await _setLastPage(ref, visibleChapter.value, currentPage);

              return true;
            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              backgroundColor: Colors.black,
              appBar: ReaderAppBar(chapter: visibleChapter.value),
              body: GestureDetector(
                onTap: () => ref
                    .read(readerAppbarControllerProvider.notifier)
                    .toggleVisibility(),
                child: ScrollingViewer(
                  child: ReaderLoader(
                    mangaId: mangaId,
                    currentChapter: visibleChapter.value,
                    reverse: isReadingInReverse.value,
                    loadNextChapter: () => appendNextChapter(
                      ref,
                      visibleChapter,
                      loadedChapterIds,
                      fetchingMoreResults,
                    ),
                    loadPreviousChapter: () => loadPreviousChapter(
                      ref,
                      visibleChapter,
                      loadedChapterIds,
                      markedAsReadIds,
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: ref.watch(settingsProvider).when(
                            initial: () => EdgeInsets.zero,
                            loaded: (settings) => EdgeInsets.symmetric(
                              horizontal: settings.padding.toDouble(),
                            ),
                          ),
                      reverse: isReadingInReverse.value,
                      itemCount: ref
                          .watch(readerPagesControllerProvider(mangaId))
                          .length,
                      itemBuilder: (context, index) {
                        final pages =
                            ref.watch(readerPagesControllerProvider(mangaId));
                        final sortedPages = isReadingInReverse.value
                            ? pages.reversed.toList()
                            : pages;
                        final page = sortedPages[index];

                        if (page.url == "page-break") {
                          return Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                const Text("Finished:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                    "Chapter: ${page.previousChapter?.chapterNo}"),
                                const SizedBox(height: 20),
                                const Text("Next Chapter:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("Chapter: ${page.chapter.chapterNo}"),
                              ],
                            ),
                          );
                        }

                        // Attemping to mitigate flutter lists jumping all the way to
                        // top of the list when scrolling up a tiny bit and a new page is rendered
                        // We render keep 3 chapters worth of pages alive while offscreen,
                        // This will _eventually_ result in jumping when scrolling back up
                        // but is unlikely to happen when scrolling within the same chapter
                        // or even the previous, but it will happen and this uses more
                        // memory as a result. This is a tradeoff I'm willing to make for now.
                        final keepPageAlive = page.chapter.chapterNo >
                            visibleChapter.value.chapterNo - 3;

                        return MangaPage(
                          page: page,
                          keepAlive: keepPageAlive,
                          onPageVisible: ((page) {
                            log("Page ${page.pageNumber} visible");

                            currentPage.value = index + 1;
                            visibleChapter.value = page.chapter;

                            log("READ PAGE - markChapterAsRead: currentChapterNo: ${visibleChapter.value.chapterNo}, page: ${page.pageNumber}, Total Pages: ${page.totalPages}");

                            if (page.pageNumber > page.totalPages - 2) {
                              log("READ PAGE: Nearing end so attempt to mark as read");
                              markChapterAsRead(
                                ref,
                                page.chapter,
                                markedAsReadIds,
                                markingAsRead,
                              );
                            }

                            final halfWayPoint = page.totalPages / 2;

                            if (page.pageNumber > halfWayPoint) {
                              log("At least half way through chapter");
                              appendNextChapter(
                                ref,
                                visibleChapter,
                                loadedChapterIds,
                                fetchingMoreResults,
                              );
                            }
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: ReaderBottomAppBar(
                mangaId: mangaId,
                numberOfPages:
                    ref.watch(readerPagesControllerProvider(mangaId)).length,
                chapter: currentChapter.value,
                currentPage: currentPage.value,
                onChapterChanged: (newChapter) => loadNewChapter(
                  newChapter,
                  currentChapter,
                  ref,
                ),
              ),
            ),
          ),
          loading: () => ReaderLoadingContent(chapter: chapter),
          error: (String? error) => ReaderErrorContent(
            chapter: chapter,
            message: error,
          ),
        );
  }

  void loadNewChapter(
    Chapter? newChapter,
    ValueNotifier<Chapter> currentChapter,
    WidgetRef ref,
  ) {
    if (newChapter != null) {
      ref
          .read(readerPagesControllerProvider(mangaId).notifier)
          .fetchPages(newChapter);

      currentChapter.value = newChapter;
    }
  }

  Future<void> loadPreviousChapter(
    WidgetRef ref,
    ValueNotifier<Chapter> currentChapter,
    ValueNotifier<List<String>> loadedChapterIds,
    ValueNotifier<List<String>> markedAsReadIds,
  ) async {
    final upcomingChapters = _getUpcomingChapters(ref, currentChapter.value);

    if (upcomingChapters.hasPreviousChapter) {
      await ref
          .read(readerPagesControllerProvider(mangaId).notifier)
          .fetchPages(upcomingChapters.previousChapter!);

      currentChapter.value = upcomingChapters.previousChapter!;
      loadedChapterIds.value = [];
      markedAsReadIds.value = [];
    }
  }

  Future<void> appendNextChapter(
    WidgetRef ref,
    ValueNotifier<Chapter> currentChapter,
    ValueNotifier<List<String>> loadedChapterIds,
    ValueNotifier<bool> loadingMoreChapters,
  ) async {
    if (loadingMoreChapters.value) return;

    loadingMoreChapters.value = true;

    final upcomingChapters = _getUpcomingChapters(ref, currentChapter.value);

    final chapterIsLoaded = loadedChapterIds.value
        .where((id) => id == upcomingChapters.nextChapter?.id)
        .isNotEmpty;

    if (chapterIsLoaded) {
      log("READ PAGE: Not fetching next chapter, current chapter: ${currentChapter.value.id}");
      loadingMoreChapters.value = false;
      return;
    }

    if (upcomingChapters.hasNextChapter) {
      log("READ PAGE: Fetching next chapter, current chapter: ${currentChapter.value.id} ");

      final previousChapter = currentChapter.value;
      loadedChapterIds.value.add(chapter.id);
      currentChapter.value = upcomingChapters.nextChapter!;

      final pagesController =
          ref.read(readerPagesControllerProvider(mangaId).notifier);

      await pagesController.appendChapterPages(
        previousChapter,
        upcomingChapters.nextChapter!,
      );

      loadedChapterIds.value.add(upcomingChapters.nextChapter!.id);
    }

    loadingMoreChapters.value = false;
  }

  Future<void> markChapterAsRead(
    WidgetRef ref,
    Chapter currentChapter,
    ValueNotifier<List<String>> markedAsReadIds,
    ValueNotifier<bool> markingChapterAsRead,
  ) async {
    final chapterIsMarkedRead =
        markedAsReadIds.value.where((id) => id == currentChapter.id).isNotEmpty;

    if (!currentChapter.read &&
        !chapterIsMarkedRead &&
        !markingChapterAsRead.value) {
      log("READ PAGE - markChapterAsRead: Marking chapter as read: ${currentChapter.chapterNo}");
      log("READ PAGE - markChapterAsRead: Reasons: currentChapter.read: ${currentChapter.read}, chapterIsMarkedRead: $markedAsReadIds, chapterIsMarkedRead: $chapterIsMarkedRead, markingChapterAsRead.value: ${markingChapterAsRead.value}");

      markingChapterAsRead.value = true;

      final mangaDetails =
          ref.read(mangaDetailsControllerProvider(mangaId)).valueOrNull;

      if (mangaDetails?.favourite != null) {
        await ref.read(favouritesServiceProvider).markChapterAsRead(
              mangaDetails!.favourite!,
              currentChapter.chapterNo,
            );
      }
      markedAsReadIds.value.add(currentChapter.id);
    } else {
      log("READ PAGE - markChapterAsRead: Not marking chapter as read: ${currentChapter.chapterNo}");
      log("READ PAGE - markChapterAsRead: Reasons: currentChapter.read: ${currentChapter.read}, chapterIsMarkedRead: $markedAsReadIds, chapterIsMarkedRead: $chapterIsMarkedRead, markingChapterAsRead.value: ${markingChapterAsRead.value}");
    }

    markingChapterAsRead.value = false;
  }

  ReaderUpcomingChapters _getUpcomingChapters(
    WidgetRef ref,
    Chapter currentChapter,
  ) {
    return ref.read(readerUpcomingChaptersControllerProvider(
      mangaId,
      currentChapter,
    ));
  }

  Future<void> _setLastPage(
    WidgetRef ref,
    Chapter chapter,
    ValueNotifier<int> currentPage,
  ) async {
    final mangaDetails =
        ref.read(mangaDetailsControllerProvider(mangaId)).valueOrNull;

    if (mangaDetails?.favourite != null) {
      final pages = ref.watch(readerPagesControllerProvider(mangaId));
      final lastPage = pages[currentPage.value - 1];

      int lastReadPage = 0;

      if (lastPage.url == "page-break") {
        lastReadPage = pages[pages.length - 2].pageNumber;
      } else {
        lastReadPage = lastPage.pageNumber;
      }

      await ref.read(favouritesServiceProvider).setLastRead(
            mangaDetails!.favourite!,
            chapter,
            lastReadPage,
          );
    }
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
