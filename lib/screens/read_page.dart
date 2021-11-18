import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/reader_appbar/readerappbar_cubit.dart';
import 'package:fluttiyomi/manga_dex/chapter_details/chapter_details_cubit.dart';
import 'package:fluttiyomi/manga_dex/reader_progress/reader_progress_cubit.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_appbar.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_bottom_appbar.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loading_content.dart';
import 'package:fluttiyomi/widgets/manga_reader/scrolling_viewer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReadPage extends StatefulWidget {
  final String mangaId;
  final Chapter chapter;
  final ChapterList chapters;
  final int currentChapter;

  const ReadPage({
    Key? key,
    required this.mangaId,
    required this.chapter,
    required this.chapters,
    required this.currentChapter,
  }) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterDetailsCubit, ChapterDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => ReaderLoadingContent(chapter: widget.chapter),
          loaded: (mangaId, chapterDetails, chapterList, currentChapter,
              startFromEnd) {
            Chapter chapter = chapterList.get(currentChapter);

            var pages = chapterDetails.pages;

            if (startFromEnd) {
              pages = pages.reversed.toList();
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              backgroundColor: Colors.black,
              appBar: ReaderAppBar(chapter: chapter),
              body: GestureDetector(
                onTap: () {
                  BlocProvider.of<ReaderappbarCubit>(context)
                      .toggleVisibility();
                },
                child: ScrollingViewer(
                  child: ReaderLoader(
                      reverse: startFromEnd,
                      child: ListView.builder(
                        reverse: startFromEnd,
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          var item = pages[index];

                          return VisibilityDetector(
                            key: Key("Page-${index + 1}"),
                            child: Image.network(item),
                            onVisibilityChanged: (visibilityInfo) {
                              // App crashes without this, seems to get called after popping screen off
                              // of stack.
                              if (visibilityInfo.visibleFraction == 0) {
                                return;
                              }

                              BlocProvider.of<ReaderProgressCubit>(context)
                                  .moveProgressForVisibilityInfo(
                                visibilityInfo,
                              );
                            },
                          );
                        },
                      ),
                      currentChapter: currentChapter + 1,
                      maxChapters: chapterList.length),
                ),
              ),
              bottomNavigationBar: ReaderBottomAppBar(
                numberOfPages: chapterDetails.pages.length,
              ),
            );
          },
        );
      },
      bloc: BlocProvider.of<ChapterDetailsCubit>(context)
        ..getChapterDetails(
          widget.mangaId,
          widget.chapter.id,
          widget.chapters,
          widget.currentChapter,
          false,
        ),
    );
  }
}
