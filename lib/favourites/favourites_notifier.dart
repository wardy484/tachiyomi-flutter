import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:fluttiyomi/favourites/firestore/favourite.dart';
import 'package:fluttiyomi/favourites/firestore/favourite_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/settings/settings_repository.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttiyomi/extensions/list.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>(
  (ref) {
    return FavouritesNotifier(
      ref.watch(favouritesRepositoryProvider),
      ref.watch(settingsRepositoryProvider),
      ref.watch(sourceClientProvider.state).state,
      ref.watch(updateQueueProvider.notifier),
    );
  },
);

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final FavouritesRepository _favourites;
  final SettingsRepository _settings;
  final SourceClient _source;
  final UpdateQueueNotifier _updateQueue;

  FavouritesNotifier(
    FavouritesRepository favourites,
    SettingsRepository settings,
    SourceClient source,
    UpdateQueueNotifier updateQueue,
  )   : _favourites = favourites,
        _settings = settings,
        _source = source,
        _updateQueue = updateQueue,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(
      _sortAndGroupFavourites(favourites),
      false,
    );
  }

  Future<void> checkForUpdates() async {
    List<Favourite> favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(_sortAndGroupFavourites(favourites), true);

    for (var e in favourites) {
      var future = getLatestChapters(e.mangaId);

      _updateQueue.addToQueue(e.name, () => future);

      future.then((value) {
        final List<String> newChapters = [
          ...e.newChapterIds,
          ...value,
        ];
        e.copyWith(newChapterIds: newChapters.unique());
        _favourites.update([e]);
      });

      _updateQueue.setOnComplete(() async {
        List<Favourite> favourites = await _favourites.getFavourites();

        state = FavouritesState.loaded(
          _sortAndGroupFavourites(favourites),
          false,
        );
      });
    }

    await _settings.updateGlobalSettings(DateTime.now());
  }

  Future<void> markAsOpened(String mangaId, String chapterId) async {
    Favourite? favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite is Favourite) {
      favourite = favourite.copyWith(
        newChapterIds:
            favourite.newChapterIds.where((id) => id != chapterId).toList(),
      );
      _favourites.update([favourite]);
    }

    var favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(
      _sortAndGroupFavourites(favourites),
      false,
    );
  }

  Future<void> markManyAsOpened(
    String mangaId,
    List<String> chapterIds,
  ) async {
    _favourites.markManyAsOpened(
      _source.sourceId,
      mangaId,
      chapterIds,
    );

    var favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(
      _sortAndGroupFavourites(favourites),
      false,
    );
  }

  Future<List<String>> getLatestChapters(
    String mangaId,
  ) async {
    log('Fetching latest chapters for $mangaId');

    Favourite? favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite == null) {
      log("Favourite not found for $mangaId");
      return [];
    }

    ChapterList chapterList = await _source.getChapters(mangaId);
    List<Chapter> newChapters = await compute(_sortNewChapters, {
      "savedChapters": favourite.chapters.toList(),
      "chapterList": chapterList
    });

    await _favourites.addChapters(favourite, newChapters);

    return newChapters.map((chapter) => chapter.id).toList();
  }

  Future<LastReadChapter> getLastReadChapter(String mangaId) async {
    var favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite == null) return LastReadChapter();

    if (favourite.lastChapterRead is! Chapter) {
      return LastReadChapter();
    }

    return LastReadChapter(
      chapter: favourite.lastChapterRead,
      page: favourite.lastChapterRead?.page,
    );
  }

  List<Favourite> _sortAndGroupFavourites(List<Favourite> favourites) {
    final withNewChapters = favourites
        .where((favourite) => favourite.newChapterIds.isNotEmpty)
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    final withNoNewChapters = favourites
        .where((favourite) => favourite.newChapterIds.isEmpty)
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    withNewChapters.addAll(withNoNewChapters);

    return withNewChapters;
  }
}

class LastReadChapter {
  final Chapter? chapter;
  final int? _page;

  LastReadChapter({
    this.chapter,
    int? page,
  }) : _page = page;

  bool get hasChapter {
    return chapter is Chapter;
  }

  int get nextPage {
    return _page ?? 0;
  }
}

// External function so it can be run in an isolate
List<Chapter> _sortNewChapters(Map args) {
  List<Chapter> savedChapters = args['savedChapters'];
  ChapterList chapterList = args['chapterList'] as ChapterList;

  if (savedChapters.isEmpty) return [];

  savedChapters.sort((a, b) {
    return b.chapterNo.compareTo(a.chapterNo);
  });

  final latestChapter = savedChapters.first;

  return chapterList.chapters.where((chapter) {
    return chapter.chapterNo > latestChapter.chapterNo;
  }).toList();
}
