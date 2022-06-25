import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 40,
            ),
            const SizedBox(
              width: 35,
              height: 30,
            ),
            const SizedBox(
              width: 40,
            ),
            const SizedBox(
              width: 35,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                iconSize: 30,
                onPressed: () {
                  if (favourite != null) {
                    ref.read(mangaDetailsNotifierProvider.notifier).markAsRead(
                          favourite!,
                          chapter.chapterNo,
                        );
                  }

                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.check),
              ),
            ),
            const SizedBox(
              width: 35,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                iconSize: 30,
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
                icon: const FaIcon(FontAwesomeIcons.checkDouble),
              ),
            ),
            // IconButton(
            //   iconSize: 40,
            //   onPressed: () async {
            //     if (favourite != null) {
            //       final chapterIds = chapterList
            //           .toList()
            //           .where((e) => e.chapterNo <= chapter.chapterNo)
            //           .map((chapter) => chapter.chapterNo)
            //           .toList();

            //       ref
            //           .read(mangaDetailsNotifierProvider.notifier)
            //           .markManyAsRead(
            //             favourite!,
            //             chapterIds,
            //           );
            //     }

            //     Navigator.pop(context);
            //   },
            //   icon: const Icon(Icons.all_inbox),
            // ),
          ],
        ),
      ),
    );
  }
}
