import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_paging_indicator.dart';
import 'package:fluttiyomi/reader/presentation/reader_progress_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReaderLoaderHeader extends ConsumerStatefulWidget {
  final Source source;
  final bool reverse;
  final String mangaId;
  final Chapter currentChapter;

  const ReaderLoaderHeader({
    Key? key,
    required this.source,
    required this.reverse,
    required this.mangaId,
    required this.currentChapter,
  }) : super(key: key);

  @override
  _ReaderLoaderHeaderState createState() => _ReaderLoaderHeaderState();
}

class _ReaderLoaderHeaderState extends ConsumerState<ReaderLoaderHeader>
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
    final upcomingChapters = ref.watch(readerUpcomingChaptersControllerProvider(
      widget.source,
      widget.mangaId,
      widget.currentChapter,
    ));

    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget body;
        if ((widget.reverse && upcomingChapters.nextChapter == null) ||
            (!widget.reverse && upcomingChapters.previousChapter == null)) {
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
            child: SizedBox(
              height: 82,
              child: Center(child: body),
            ),
          );
        }
        return SizedBox(
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
