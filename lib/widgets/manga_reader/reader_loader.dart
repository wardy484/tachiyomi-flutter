import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_notifier.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_footer.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoader extends ConsumerStatefulWidget {
  final Widget child;
  final Chapter? nextChapter;
  final Chapter? previousChapter;
  final bool reverse;

  const ReaderLoader({
    Key? key,
    required this.child,
    required this.nextChapter,
    required this.previousChapter,
    required this.reverse,
  }) : super(key: key);

  @override
  _ReaderLoaderState createState() => _ReaderLoaderState();
}

class _ReaderLoaderState extends ConsumerState<ReaderLoader> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    if (widget.nextChapter == null) {
      _refreshController.loadNoData();
    }

    return ScrollConfiguration(
      behavior: DisableGlowingOverscrollIndicator(),
      child: SmartRefresher(
        reverse: widget.reverse,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ReaderLoaderHeader(
          nextChapter: widget.nextChapter,
          previousChapter: widget.previousChapter,
          reverse: widget.reverse,
        ),
        footer: ReaderLoaderFooter(
          nextChapter: widget.nextChapter,
          previousChapter: widget.previousChapter,
          reverse: widget.reverse,
        ),
        onRefresh: () async {
          if (widget.reverse) {
            await ref.read(chapterDetailsProvider.notifier).nextChapter();
          } else {
            await ref.read(chapterDetailsProvider.notifier).previousChapter();
          }

          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          if (!widget.reverse) {
            await ref.read(chapterDetailsProvider.notifier).nextChapter();
          } else {
            await ref.read(chapterDetailsProvider.notifier).previousChapter();
          }

          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        child: widget.child,
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
