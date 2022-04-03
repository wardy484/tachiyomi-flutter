import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/updated_chapters/updated_chapters.dart';
import 'package:fluttiyomi/database/models.dart' as models;
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
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

  Future<void> deleteLatestChapters() async {
    List<Favourite> favourites = await _favourites.getFavourites();
    await favourites.first.chapters.load();

    var chaps = favourites.first.chapters.toList()
      ..sort((a, b) {
        return double.parse(b.chapterId).compareTo(double.parse(a.chapterId));
      });

    for (var i = 0; i < 9; i++) {
      _favourites.deleteChapter(chaps[i]);
    }
  }

  Future<void> checkForUpdates() async {
    // await deleteLatestChapters();
    Setting settings = await _settings.getGlobalSettings();

    List<Favourite> favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(_sortAndGroupFavourites(favourites), true);

    UpdatedChapters updated = await _source.checkForUpdates(
      favourites.map<String>((e) => e.mangaId).toList(),
      // settings.lastUpdateCheck,
      DateTime.now().subtract(Duration(days: 1)),
    );

    for (var e in favourites) {
      var future = getLatestChapters(e.mangaId);

      _updateQueue.addToQueue(e.name, () => future);

      future.then((value) {
        e.newChapterIds.addAll(value);
        e.newChapterIds = e.newChapterIds.unique();
        _favourites.update([e]);

        print(e.newChapterIds);
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
      favourite.newChapterIds.removeWhere((id) => id == chapterId);
      _favourites.update([favourite]);
    }

    var favourites = await _favourites.getFavourites();
    state = FavouritesState.loaded(
      _sortAndGroupFavourites(favourites),
      false,
    );
  }

  Future<List<String>> getLatestChapters(
    String mangaId,
  ) async {
    Favourite? favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite == null) return [];

    await favourite.chapters.load();

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

    await favourite.lastChapterRead.load();

    if (favourite.lastChapterRead.value is! models.Chapter) {
      return LastReadChapter();
    }

    return LastReadChapter(
      chapter: favourite.lastChapterRead.value!.convertToChapter(),
      page: favourite.lastChapterRead.value!.page,
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
  List<models.Chapter> savedChapters = args['savedChapters'];
  ChapterList chapterList = args['chapterList'] as ChapterList;

  savedChapters.sort((a, b) {
    return b.chapterNo.compareTo(a.chapterNo);
  });

  final latestChapter = savedChapters.first;
  // _favourites.deleteChapter(latestChapter);

  return chapterList.chapters.where((chapter) {
    return chapter.chapterNo > latestChapter.chapterNo;
  }).toList();
}
