import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_paging_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoaderFooter extends StatefulWidget {
  final Chapter? nextChapter;
  final Chapter? previousChapter;
  final bool reverse;

  const ReaderLoaderFooter({
    Key? key,
    required this.nextChapter,
    required this.previousChapter,
    required this.reverse,
  }) : super(key: key);

  @override
  _ReaderLoaderFooterState createState() => _ReaderLoaderFooterState();
}

class _ReaderLoaderFooterState extends State<ReaderLoaderFooter>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: widget.reverse ? 90 : 60,
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if ((widget.reverse && widget.previousChapter == null) ||
            (!widget.reverse && widget.nextChapter == null)) {
          body = const Text("No more chapters");
        } else if (mode == LoadStatus.idle) {
          body = ReaderPagingIndicator(
            controller: controller,
            label: widget.reverse ? "Previous Chapter" : "Next Chapter",
          );
        } else if (mode == LoadStatus.loading) {
          body = const CircularProgressIndicator();
        } else if (mode == LoadStatus.canLoading) {
          body = ReaderPagingIndicator(
            controller: controller,
            label: "Release to load",
          );
        } else {
          body = const Text("No more chapters");
        }

        if (widget.reverse) {
          return SizedBox(
            height: 120,
            child: Center(child: body),
          );
        }

        return SizedBox(
          height: 82,
          child: Center(child: body),
        );
      },
      onOffsetChange: (offset) {
        setState(() {
          var percentage = (offset / 120) * 100;
          controller.value = offset > 0 ? percentage / 100 : 0;
        });
      },
    );
  }
}
