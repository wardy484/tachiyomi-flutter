import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_progress_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReaderBottomAppBar extends ConsumerWidget {
  final String mangaId;
  final Chapter chapter;
  final int numberOfPages;
  final int currentPage;
  final void Function(Chapter chapter) onChapterChanged;

  const ReaderBottomAppBar({
    Key? key,
    required this.mangaId,
    required this.numberOfPages,
    required this.chapter,
    required this.currentPage,
    required this.onChapterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedOpacity(
      opacity: ref.watch(readerAppbarControllerProvider) ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: BottomAppBar(
        color: Colors.black.withOpacity(0.9),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: StatefulBuilder(
                builder: (context, state) {
                  int totalPages =
                      ref.watch(readerPagesControllerProvider(mangaId)).length;

                  return Text(
                    "$currentPage/$totalPages",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    final newChapter = ref
                        .read(readerUpcomingChaptersControllerProvider(
                          mangaId,
                          chapter,
                        ))
                        .previousChapter;

                    if (newChapter != null) {
                      onChapterChanged(newChapter);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    final newChapter = ref
                        .read(readerUpcomingChaptersControllerProvider(
                          mangaId,
                          chapter,
                        ))
                        .nextChapter;

                    if (newChapter != null) {
                      onChapterChanged(newChapter);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
