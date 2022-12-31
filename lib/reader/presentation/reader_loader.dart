import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_loader_footer.dart';
import 'package:fluttiyomi/reader/presentation/reader_loader_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoader extends ConsumerStatefulWidget {
  final String mangaId;
  final Chapter currentChapter;
  final Widget child;
  final bool reverse;

  const ReaderLoader({
    Key? key,
    required this.child,
    required this.reverse,
    required this.mangaId,
    required this.currentChapter,
  }) : super(key: key);

  @override
  _ReaderLoaderState createState() => _ReaderLoaderState();
}

class _ReaderLoaderState extends ConsumerState<ReaderLoader> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    // TODO: figure out how to get no previous chapter state wihtout reloading whole widget

    return ScrollConfiguration(
      behavior: DisableGlowingOverscrollIndicator(),
      child: SmartRefresher(
        reverse: widget.reverse,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ReaderLoaderHeader(
          mangaId: widget.mangaId,
          currentChapter: widget.currentChapter,
          reverse: widget.reverse,
        ),
        footer: ReaderLoaderFooter(
          mangaId: widget.mangaId,
          currentChapter: widget.currentChapter,
          reverse: widget.reverse,
        ),
        onRefresh: () async {
          // TODO: Update to use new chapter details provider
          // if (widget.reverse) {
          //   await ref.read(chapterDetailsProvider.notifier).nextChapter();
          // } else {
          //   await ref.read(chapterDetailsProvider.notifier).previousChapter();
          // }

          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          // if (!widget.reverse) {
          //   await ref.read(chapterDetailsProvider.notifier).nextChapter();
          // } else {
          //   await ref.read(chapterDetailsProvider.notifier).previousChapter();
          // }

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
