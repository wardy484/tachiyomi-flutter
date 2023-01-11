import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';

import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContinueButton extends ConsumerWidget {
  final Source source;
  final String mangaId;

  const ContinueButton({
    Key? key,
    required this.source,
    required this.mangaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () async {
          final manga =
              ref.read(mangaDetailsControllerProvider(source, mangaId)).value;
          final favourite = manga?.favourite;
          Chapter chapter;

          if (manga == null) return;

          if (favourite != null) {
            chapter = favourite.lastChapterRead ?? favourite.chapters.first;
          } else {
            chapter = manga.chapters.chapters.first;
          }

          AutoRouter.of(context).push(
            ReaderRoute(
              source: source,
              mangaId: mangaId,
              chapter: chapter,
            ),
          );
        },
        label: const Text("Continue"),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
