import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/downloads/download_notifier.dart';
import 'package:fluttiyomi/favourites/applications/favourites_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/widgets/common/context_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterOptions extends ConsumerWidget {
  final Favourite favourite;
  final Chapter chapter;

  const ChapterOptions({
    Key? key,
    required this.favourite,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ContextMenu(
      children: [
        ContextMenuItem(
          icon: FontAwesomeIcons.check,
          onPressed: () {
            ref
                .read(favouritesServiceProvider)
                .markChapterAsRead(favourite, chapter.chapterNo);
          },
        ),
        ContextMenuItem(
          icon: FontAwesomeIcons.checkDouble,
          onPressed: () {
            ref
                .read(favouritesServiceProvider)
                .markAllPriorChaptersAsRead(favourite, chapter.chapterNo);
          },
        ),
        ContextMenuItem(
          icon: FontAwesomeIcons.download,
          onPressed: () {
            ref
                .read(downloadProvider.notifier)
                .addDownload(favourite.toManga(), chapter);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to download queue.'),
              ),
            );
          },
        ),
      ],
    );
  }
}
