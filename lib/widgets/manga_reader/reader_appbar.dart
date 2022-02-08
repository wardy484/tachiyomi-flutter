import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReaderAppBar extends ConsumerWidget with PreferredSizeWidget {
  final Chapter chapter;

  const ReaderAppBar({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedOpacity(
      opacity: ref.watch(readerProvider).appbarVisible ? 0 : 1,
      duration: const Duration(milliseconds: 100),
      child: AppBar(
        title: Text(
          chapter.name ?? "Chapter ${chapter.chapterNo}",
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0,
      ),
    );
  }
}
