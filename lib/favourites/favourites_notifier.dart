import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/chapter_updates/repositories/chapter_updates_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/settings/settings_repository.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>(
  (ref) {
    return FavouritesNotifier(
      ref.watch(favouritesRepositoryProvider),
      ref.watch(settingsRepositoryProvider),
      ref.watch(sourceClientProvider.state).state,
      ref.watch(updateQueueProvider.notifier),
      ref.watch(authRepositoryProvider),
      ref.watch(chapterUpdatesRepositoryProvider),
    );
  },
);

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final FavouritesRepository _favourites;
  final SettingsRepository _settings;
  final SourceClient _source;
  final UpdateQueueNotifier _updateQueue;
  final AuthRepository _auth;
  final ChapterUpdatesRepository _chapterUpdatesRepository;
  StreamSubscription<List<Favourite>?>? _favouritesStream;

  FavouritesNotifier(
    FavouritesRepository favourites,
    SettingsRepository settings,
    SourceClient source,
    UpdateQueueNotifier updateQueue,
    AuthRepository auth,
    ChapterUpdatesRepository chapterUpdatesRepository,
  )   : _favourites = favourites,
        _settings = settings,
        _source = source,
        _updateQueue = updateQueue,
        _auth = auth,
        _chapterUpdatesRepository = chapterUpdatesRepository,
        super(const FavouritesState.initial());

  Future<void> watchFavourites() async {
    log("READ: Watching favourites");

    _favouritesStream =
        _favourites.watchFavourites(_auth.currentUser).listen((favourites) {
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

  Future<void> getLatestChapters(Favourite favourite) async {
    log('Fetching latest chapters for ${favourite.mangaId}');

    // Do not hit sources if we've got lots of chapters left to read
    if (favourite.unreadChapterCount > 5) return;

    ChapterList chapterList = await _source.getChapters(favourite.mangaId);

    List<Chapter> newChapters = await compute(_filterNewChapters, {
      "savedChapters": ChapterList(favourite.chapters),
      "chapterList": chapterList,
    });

    final newChapterList = ChapterList(newChapters);

    if (newChapters.isNotEmpty) {
      final completeChapterList = ChapterList([
        ...favourite.chapters,
        ...newChapters,
      ]);

      final newFavourite = favourite.copyWith(
        latestChapterNumber:
            newChapterList.descending().toList().first.chapterNo,
        unreadChapterCount: completeChapterList.unreadChapters(),
        chapters: completeChapterList.descending().toList(),
      );

      _favourites.update(
        _auth.currentUser,
        [newFavourite],
      );

      _chapterUpdatesRepository.addChapterUpdates(
        _auth.currentUser,
        favourite,
        newChapters,
      );
    }
  }

  Future<LastReadChapter> getLastReadChapter(String mangaId) async {
    var favourite = await _favourites.getFavourite(
      _auth.currentUser,
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
      return favourite.unreadChapterCount > 0;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    final withNoNewChapters = favourites.where((favourite) {
      return favourite.unreadChapterCount < 1;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    withNewChapters.addAll(withNoNewChapters);

    return withNewChapters;
  }

  Favourite? getFavouriteByMangaId(String mangaId) {
    return state.when(
      initial: () => null,
      loaded: (favourites, updating) {
        for (var favourite in favourites) {
          if (favourite.mangaId == mangaId) {
            return favourite;
          }
        }

        return null;
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
  ChapterList savedChapters = args["savedChapters"] as ChapterList;
  ChapterList remoteChapters = args['chapterList'] as ChapterList;

  if (remoteChapters.length < 1) return [];

  final newChapters = remoteChapters.toList().where((chapter) {
    return !savedChapters.toList().where((savedChapter) {
      return savedChapter.chapterNo == chapter.chapterNo;
    }).isNotEmpty;
  }).toList();

  return newChapters;
}
