import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_loader_footer.dart';
import 'package:fluttiyomi/reader/presentation/reader_loader_header.dart';
import 'package:fluttiyomi/reader/presentation/reader_progress_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoader extends ConsumerStatefulWidget {
  final Source source;
  final String mangaId;
  final Chapter currentChapter;
  final Widget child;
  final bool reverse;
  final Future<void> Function() loadNextChapter;
  final Future<void> Function() loadPreviousChapter;

  const ReaderLoader({
    Key? key,
    required this.source,
    required this.child,
    required this.reverse,
    required this.mangaId,
    required this.currentChapter,
    required this.loadNextChapter,
    required this.loadPreviousChapter,
  }) : super(key: key);

  @override
  _ReaderLoaderState createState() => _ReaderLoaderState();
}

class _ReaderLoaderState extends ConsumerState<ReaderLoader> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    ref.listen(
        readerUpcomingChaptersControllerProvider(
          widget.source,
          widget.mangaId,
          widget.currentChapter,
        ), (_, ReaderUpcomingChapters next) {
      if (!next.hasNextChapter) {
        _refreshController.loadNoData();
      }
    });

    return ScrollConfiguration(
      behavior: DisableGlowingOverscrollIndicator(),
      child: SmartRefresher(
        reverse: widget.reverse,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ReaderLoaderHeader(
          source: widget.source,
          mangaId: widget.mangaId,
          currentChapter: widget.currentChapter,
          reverse: widget.reverse,
        ),
        footer: ReaderLoaderFooter(
          source: widget.source,
          mangaId: widget.mangaId,
          currentChapter: widget.currentChapter,
          reverse: widget.reverse,
        ),
        onRefresh: () async {
          if (widget.reverse) {
            await widget.loadNextChapter();
          } else {
            await widget.loadPreviousChapter();
          }

          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          if (!widget.reverse) {
            await widget.loadNextChapter();
          } else {
            await widget.loadPreviousChapter();
          }

          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        child: widget.child,
        cacheExtent: 5000,
      ),
    );
  }
}

class DisableGlowingOverscrollIndicator extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
