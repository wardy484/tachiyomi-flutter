import 'package:flutter/material.dart';
import 'package:fluttiyomi/widgets/manga_reader/reader_paging_indicator.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoaderHeader extends StatefulWidget {
  final int currentChapter;
  final int maxChapters;
  final bool reverse;

  const ReaderLoaderHeader({
    Key? key,
    required this.currentChapter,
    required this.maxChapters,
    required this.reverse,
  }) : super(key: key);

  @override
  _ReaderLoaderHeaderState createState() => _ReaderLoaderHeaderState();
}

class _ReaderLoaderHeaderState extends State<ReaderLoaderHeader>
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
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget body;
        if ((widget.reverse && widget.currentChapter == widget.maxChapters) ||
            (!widget.reverse && widget.currentChapter == 0)) {
          body = const Text("No more chapters");
        } else if (mode == RefreshStatus.idle) {
          body = ReaderPagingIndicator(
            controller: controller,
            label: widget.reverse ? "Next Chapter" : "Previous Chapter",
          );
        } else if (mode == RefreshStatus.refreshing) {
          body = const CircularProgressIndicator();
        } else if (mode == RefreshStatus.canRefresh) {
          body = ReaderPagingIndicator(
            controller: controller,
            label: "Release to load",
          );
        } else {
          body = const Text("No more chapters");
        }

        if (widget.reverse) {
          return RotatedBox(
            quarterTurns: 2,
            child: Container(
              height: 82,
              child: Center(child: body),
            ),
          );
        }
        return Container(
          height: 82,
          child: Center(child: body),
        );
      },
      onOffsetChange: (offset) {
        setState(() {
          var percentage = (offset / HEADER_TRIGGER_DISTANCE) * 100;
          controller.value = offset > 0 ? percentage / 100 : 0;
        });
      },
    );
  }
}
