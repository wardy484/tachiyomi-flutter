import 'dart:developer';

import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/downloads/application/download_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesUpdateService {
  final Ref ref;

  FavouritesUpdateService({
    required this.ref,
  });

  Future<List<Chapter>> getLatestChapters(Favourite favourite) async {
    log('Fetching latest chapters for ${favourite.name}');

    final sourceClient = ref.watch(sourceProvider);

    log("Check if ${favourite.name} has too many unread chapters ");
    if (favourite.unreadChapterCount > 7) {
      log('Skipping ${favourite.name} because it has too many unread chapters');
      return [];
    }

    log("Getting chapters for ${favourite.name} (${favourite.mangaId})");

    ChapterList chapterList = await sourceClient.getChapters(favourite.mangaId);

    log('Got ${chapterList.length} chapters for ${favourite.name}, already had ${favourite.chapters.length}');

    ChapterList newChapterList = _filterNewChapters({
      "savedChapters": ChapterList(favourite.chapters),
      "chapterList": chapterList,
    });

    if (newChapterList.isEmpty) {
      log('No new chapters for ${favourite.name}');
      return [];
    }

    log('Got ${newChapterList.length} new chapters for ${favourite.name}');

    final latestChapter = newChapterList.descending().toList().first;
    final completeChapterList = newChapterList.append(favourite.chapters);

    final newFavourite = favourite.copyWith(
      latestChapterNumber: latestChapter.chapterNo,
      unreadChapterCount: completeChapterList.unreadChapters(),
      chapters: completeChapterList.descending().toList(),
    );

    log('Updating ${favourite.name} with ${newChapterList.length} new chapters');

    ref.read(favouritesRepositoryProvider).update(
      ref.watch(authRepositoryProvider).currentUser,
      [newFavourite],
    );

    log("Notifying download provider of new chapters for ${favourite.name}");
    ref.read(downloadServiceProvider).downloadChaptersInBackground(
          favourite.toManga(),
          newChapterList.chapters,
        );

    return newChapterList.chapters;
  }

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
}

final favouritesUpdateServiceProvider =
    Provider<FavouritesUpdateService>((ref) {
  return FavouritesUpdateService(ref: ref);
});
