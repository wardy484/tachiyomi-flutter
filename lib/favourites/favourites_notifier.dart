import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/database/chapter.dart' as chapter_model;
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/settings/settings_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>(
  (ref) {
    return FavouritesNotifier(
      ref.watch(favouritesRepositoryProvider),
      ref.watch(settingsRepositoryProvider),
      ref.watch(sourceClientProvider.state).state,
    );
  },
);

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final FavouritesRepository _favourites;
  final SettingsRepository _settings;
  final SourceClient _source;

  FavouritesNotifier(
    FavouritesRepository favourites,
    SettingsRepository settings,
    SourceClient source,
  )   : _favourites = favourites,
        _settings = settings,
        _source = source,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(favourites, false);
  }

  Future<void> checkForUpdates() async {
    Setting settings = await _settings.getGlobalSettings();

    List<Favourite> favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(favourites, true);

    await _source.checkForUpdates(
      favourites.map<String>((e) => e.mangaId).toList(),
      settings.lastUpdateCheck,
      // DateTime.now().subtract(Duration(minutes: 20)),
      (updated) async {
        for (var e in favourites) {
          if (updated.contains(e.mangaId)) {
            e.hasNewChapters = true;
            await getLatestChapters(e.mangaId);
          }
        }

        _favourites.update(favourites);
        state = FavouritesState.loaded(favourites, false);
      },
    );

    await _settings.updateGlobalSettings(DateTime.now());
  }

  Future<void> markAsOpened(String mangaId) async {
    Favourite? favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite is Favourite) {
      favourite.hasNewChapters = false;

      _favourites.update([favourite]);
    }
  }

  Future<void> getLatestChapters(
    String mangaId,
  ) async {
    Favourite? favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite == null) return;

    await favourite.chapters.load();

    ChapterList chapterList = await _source.getChapters(mangaId);
    List<Chapter> newChapters = await compute(_sortNewChapters, {
      "savedChapters": favourite.chapters.toList(),
      "chapterList": chapterList
    });

    await _favourites.addChapters(favourite, newChapters);
  }

  Future<LastReadChapter> getLastReadChapter(String mangaId) async {
    var favourite = await _favourites.getFavourite(
      _source.sourceId,
      mangaId,
    );

    if (favourite == null) return LastReadChapter();

    await favourite.lastChapterRead.load();

    if (favourite.lastChapterRead.value is! chapter_model.Chapter) {
      return LastReadChapter();
    }

    return LastReadChapter(
      chapter: favourite.lastChapterRead.value!.convertToChapter(),
      page: favourite.lastChapterRead.value!.page,
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
List<Chapter> _sortNewChapters(Map args) {
  List<chapter_model.Chapter> savedChapters = args['savedChapters'];
  ChapterList chapterList = args['chapterList'] as ChapterList;

  savedChapters.sort((a, b) {
    return double.parse(b.chapterId).compareTo(double.parse(a.chapterId));
  });

  final latestChapter = savedChapters.first;
  // _favourites.deleteChapter(latestChapter);

  return chapterList.chapters.where((chapter) {
    return double.parse(chapter.id) > double.parse(latestChapter.chapterId);
  }).toList();
}
