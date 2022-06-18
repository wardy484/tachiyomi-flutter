import 'dart:async';
import 'dart:developer';
import "dart:typed_data";

import 'package:auto_route/auto_route.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/manga_details/widgets/chapter_options.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
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
                                setState(() {
                                  _transparentAppbar =
                                      visibility.visibleFraction > 0.99;
                                });
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

class FireStoreSize {
  /// Return size in bytes of the provided firestore document [fsDocument].
  int getFireStoreDocumentSize(Map<String, dynamic> fsDocument) {
    int netSizeInBytes = 0;

    fsDocument.entries.forEach((entry) {
      // First add the key size to the [netSizeInBytes]
      netSizeInBytes += entry.key.fstSize();
      // assign value to local variable
      final val = entry.value;
      // Next depending on the type of the field add the respective size to the [netSizeInBytes] variable.
      // Recursively call [getFireStoreDocumentSize] method to size of map fields as it represents the firestore map fields.
      if (val is Map<String, dynamic>) {
        netSizeInBytes += this.getFireStoreDocumentSize(val);
      } else if (val is List) {
        val.forEach((item) {
          if (item is Map<String, dynamic>) {
            // For map fields again use a recursive call
            netSizeInBytes += getFireStoreDocumentSize(item);
          } else {
            // For generic fields use the [_fieldSize] method to retrieve field specific size in bytes
            netSizeInBytes += fieldSize(item);
          }
        });
      } else {
        netSizeInBytes += fieldSize(val);
      }
    });
    return netSizeInBytes;
  }

  /// Returns field type specific size in bytes.
  /// This method doesnt return reference field sizes as it requires cloud firestore package of dart or flutter to verify the type.
  /// The [Uint8List] type is used instead of [Blob] from the cloud firetor package for berevity.
  int fieldSize(dynamic val) {
    // num,String and DateTime has the respective extension function [fstSize] to return firestoelsere specific sizes.
    if (val is String) {
      return val.fstSize();
    } else if (val is num) {
      return val.fstSize();
    } else if (val is DateTime) {
      return val.fstSize();
    } else if (val is Uint8List) {
      // Bytes field should return the size in the bytes.
      return val.lengthInBytes;
    } else if (val == null) {
      // null fields have size of 1 byte by default in firestore.
      return 1;
    }
    return 0;
  }
}

extension on String {
  int fstSize() {
    return this.length + 1;
  }
}

/// extension to create firestore size on num. Covers both int and double
extension on num {
  int fstSize() {
    return 8;
  }
}

/// extension to create firestore size on DateTime
extension on DateTime {
  int fstSize() {
    return 8;
  }
}
