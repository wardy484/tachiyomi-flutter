import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_notifier.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_footer.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';

class ReaderLoader extends ConsumerStatefulWidget {
  final Widget child;
  final int currentChapter;
  final int maxChapters;
  final bool reverse;

  const ReaderLoader({
    Key? key,
    required this.child,
    required this.currentChapter,
    required this.maxChapters,
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
    if (widget.currentChapter == 1) {
      _refreshController.loadNoData();
    }

    return SmartRefresher(
      reverse: widget.reverse,
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: ReaderLoaderHeader(
        currentChapter: widget.currentChapter,
        maxChapters: widget.maxChapters,
        reverse: widget.reverse,
      ),
      footer: ReaderLoaderFooter(
        currentChapter: widget.currentChapter,
        maxChapters: widget.maxChapters,
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
    );
  }
}
