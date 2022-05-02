import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_details/chapter_details_notifier.dart';
import 'package:fluttiyomi/reader/reader_progress_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReaderBottomAppBar extends ConsumerWidget {
  final int numberOfPages;

  const ReaderBottomAppBar({Key? key, required this.numberOfPages})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedOpacity(
      opacity: ref.watch(readerProvider).appbarVisible ? 0 : 1,
      duration: const Duration(milliseconds: 100),
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
                  String progress = ref.watch(readerProvider).when(
                        reading: (index, _, __, ___, ____) => index,
                      );

                  return Text(
                    "$progress/$numberOfPages",
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
                    ref.read(readerProvider.notifier).moveProgress(
                          progress: "1",
                        );

                    ref.read(chapterDetailsProvider.notifier).previousChapter();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    ref.read(readerProvider.notifier).moveProgress(
                          progress: "1",
                        );

                    ref.read(chapterDetailsProvider.notifier).nextChapter();
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
