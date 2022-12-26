import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar_controller.dart';
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
      opacity: ref.watch(readerAppbarControllerProvider) ? 1 : 0,
      duration: const Duration(milliseconds: 300),
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
