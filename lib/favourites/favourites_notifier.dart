import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
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
  StreamSubscription<List<Favourite>?>? _favouritesStream;

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

  Future<void> watchFavourites() async {
    log("READ: Watching favourites");

    _favouritesStream = _favourites.watchFavourites().listen((favourites) {
      log("READ: Favourites listener triggered");

      state = FavouritesState.loaded(
        _sortAndGroupFavourites(favourites),
        false,
      );
    });
  }

  void closeStream() {
    _favouritesStream?.cancel();
  }

  Future<void> checkForUpdates() async {
    state.when(
      initial: () {},
      loaded: (favourites, updating) async {
        state = FavouritesState.loaded(
          _sortAndGroupFavourites(favourites),
          true,
        );

        for (var favourite in favourites) {
          var future = getLatestChapters(favourite);

          _updateQueue.addToQueue(favourite.name, () => future);
        }

        await _settings.updateGlobalSettings(DateTime.now());
      },
    );
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
  }

  Future<List<String>> getLatestChapters(Favourite favourite) async {
    log('Fetching latest chapters for ${favourite.mangaId}');

    ChapterList chapterList = await _source.getChapters(favourite.mangaId);

    List<Chapter> newChapters = await compute(_filterNewChapters, {
      "latestChapterNumber": favourite.latestChapterNumber,
      "chapterList": chapterList
    });

    await _favourites.addChapters(favourite, newChapters);

    final latestChapterIds = newChapters.map((chapter) => chapter.id).toList();

    final List<String> newChaptersIds = [
      ...favourite.newChapterIds,
      ...latestChapterIds,
    ];

    final newChapterList = ChapterList(newChapters);

    if (newChapters.isNotEmpty) {
      final newFavourite = favourite.copyWith(
        newChapterIds: newChaptersIds.unique(),
        latestChapterNumber:
            newChapterList.descending().toList().first.chapterNo,
      );
      _favourites.update([newFavourite]);
    }

    _favourites.setUnreadChapters(_source.src, favourite.mangaId);

    return latestChapterIds;
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
    final withNewChapters = favourites.where((favourite) {
      final unreadCount = favourite.unreadChapterCount;

      if (unreadCount != null) {
        return unreadCount > 0;
      }

      return favourite.newChapterIds.isNotEmpty;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    final withNoNewChapters = favourites.where((favourite) {
      if (favourite.unreadChapterCount != null) {
        return favourite.unreadChapterCount == 0;
      }

      return favourite.newChapterIds.isEmpty;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    withNewChapters.addAll(withNoNewChapters);

    return withNewChapters;
  }

  Favourite? getFavouriteByMangaId(String mangaId) {
    return state.when(
      initial: () => null,
      loaded: (favourites, updating) {
        try {
          return favourites.firstWhere(
            (favourite) => favourite.mangaId == mangaId,
          );
        } catch (e) {
          return null;
        }
      },
    );
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
List<Chapter> _filterNewChapters(Map args) {
  double latestChapterNumber = args["latestChapterNumber"];
  ChapterList remoteChapters = args['chapterList'] as ChapterList;

  if (remoteChapters.length < 1) return [];

  return remoteChapters
      .toList()
      .where((chapter) => chapter.chapterNo > latestChapterNumber)
      .toList();
}
