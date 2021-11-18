import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/manga_dex/chapter_details/chapter_details_cubit.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_footer.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_loader_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoader extends StatefulWidget {
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

class _ReaderLoaderState extends State<ReaderLoader> {
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
        // TODO: Fix rendering and Labels on Refresh header and footer :face_palm: at least it works
        if (widget.reverse) {
          await BlocProvider.of<ChapterDetailsCubit>(context).nextChapter();
        } else {
          await BlocProvider.of<ChapterDetailsCubit>(context).previousChapter();
        }
        _refreshController.loadComplete();
      },
      onLoading: () async {
        if (!widget.reverse) {
          await BlocProvider.of<ChapterDetailsCubit>(context).nextChapter();
        } else {
          await BlocProvider.of<ChapterDetailsCubit>(context).previousChapter();
        }
        _refreshController.loadComplete();
      },
      child: widget.child,
    );
  }
}
