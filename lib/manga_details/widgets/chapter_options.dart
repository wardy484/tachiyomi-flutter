import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/downloads/download_notifier.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/manga_details/manga_details_notifier.dart';
import 'package:fluttiyomi/widgets/common/context_menu.dart';
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
    return ContextMenu(
      children: [
        ContextMenuItem(
          icon: FontAwesomeIcons.check,
          onPressed: () {
            if (favourite != null) {
              ref.read(mangaDetailsNotifierProvider.notifier).markAsRead(
                    favourite!,
                    chapter.chapterNo,
                  );
            }
          },
        ),
        ContextMenuItem(
          icon: FontAwesomeIcons.checkDouble,
          onPressed: () {
            if (favourite != null) {
              final chapterIds = chapterList
                  .toList()
                  .where((e) => e.chapterNo < chapter.chapterNo)
                  .map((chapter) => chapter.chapterNo)
                  .toList();

              ref.read(mangaDetailsNotifierProvider.notifier).markManyAsRead(
                    favourite!,
                    chapterIds,
                  );
            }
          },
        ),
        ContextMenuItem(
          icon: FontAwesomeIcons.download,
          onPressed: () {
            if (favourite != null) {
              ref
                  .read(downloadProvider.notifier)
                  .addDownload(favourite!.toManga(), chapter);

              // TODO: Theme this with dark theme
              var snackBar = const SnackBar(
                content: Text('Added to download queue.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
    );
  }
}
