import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterOptions extends ConsumerWidget {
  final Favourite? favourite;
  final Chapter chapter;
  final ChapterList chapterList;

  const ChapterOptions({
    Key? key,
    required this.favourite,
    required this.chapter,
    required this.chapterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              iconSize: 40,
              onPressed: () {
                if (favourite != null) {
                  ref.read(mangaDetailsNotifierProvider.notifier).markAsRead(
                        favourite!,
                        chapter.chapterNo,
                      );
                }

                Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
            ),
            const SizedBox(
              width: 35,
              height: 30,
            ),
            IconButton(
              iconSize: 40,
              onPressed: () async {
                if (favourite != null) {
                  final chapterIds = chapterList
                      .toList()
                      .where((e) => e.chapterNo < chapter.chapterNo)
                      .map((chapter) => chapter.chapterNo)
                      .toList();

                  ref
                      .read(mangaDetailsNotifierProvider.notifier)
                      .markManyAsRead(
                        favourite!,
                        chapterIds,
                      );
                }

                Navigator.pop(context);
              },
              icon: const Icon(Icons.file_download_done_rounded),
            ),
            IconButton(
              iconSize: 40,
              onPressed: () async {
                if (favourite != null) {
                  final chapterIds = chapterList
                      .toList()
                      .where((e) => e.chapterNo <= chapter.chapterNo)
                      .map((chapter) => chapter.chapterNo)
                      .toList();

                  ref
                      .read(mangaDetailsNotifierProvider.notifier)
                      .markManyAsRead(
                        favourite!,
                        chapterIds,
                      );
                }

                Navigator.pop(context);
              },
              icon: const Icon(Icons.all_inbox),
            ),
          ],
        ),
      ),
    );
  }
}
