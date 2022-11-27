import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/downloads/download_notifier.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesUpdateService {
  final Ref ref;

  FavouritesUpdateService({
    required this.ref,
  });

  Future<void> getLatestChapters(Favourite favourite) async {
    log('Fetching latest chapters for ${favourite.mangaId}');

    final sourceClient = ref.watch(sourceClientProvider);

    if (favourite.unreadChapterCount > 5) return;

    ChapterList chapterList = await sourceClient.getChapters(favourite.mangaId);

    ChapterList newChapterList = await compute(_filterNewChapters, {
      "savedChapters": ChapterList(favourite.chapters),
      "chapterList": chapterList,
    });

    if (newChapterList.isEmpty) return;

    final latestChapter = newChapterList.descending().toList().first;
    final completeChapterList = newChapterList.append(favourite.chapters);

    final newFavourite = favourite.copyWith(
      latestChapterNumber: latestChapter.chapterNo,
      unreadChapterCount: completeChapterList.unreadChapters(),
      chapters: completeChapterList.descending().toList(),
    );

    ref.read(favouritesRepositoryProvider).update(
      ref.watch(authRepositoryProvider).currentUser,
      [newFavourite],
    );

    ref
        .read(downloadProvider.notifier)
        .downloadNewChapters(favourite, newChapterList);
  }
}

final favouritesUpdateServiceProvider =
    Provider<FavouritesUpdateService>((ref) {
  return FavouritesUpdateService(ref: ref);
});

// External function so it can be run in an isolate
ChapterList _filterNewChapters(Map args) {
  ChapterList savedChapters = args["savedChapters"] as ChapterList;
  ChapterList remoteChapters = args['chapterList'] as ChapterList;

  if (remoteChapters.length < 1) return ChapterList([]);

  final newChapters = remoteChapters.toList().where((chapter) {
    return !savedChapters.toList().where((savedChapter) {
      return savedChapter.chapterNo == chapter.chapterNo;
    }).isNotEmpty;
  }).toList();

  return ChapterList(newChapters);
}
