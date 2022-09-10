import 'dart:async';

import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/chapter_updates/repositories/chapter_updates_repository.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';

import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mangaDetailsNotifierProvider =
    StateNotifierProvider.autoDispose<MangaDetailsNotifier, MangaDetailsState>(
  (ref) {
    return MangaDetailsNotifier(
      ref.read(sourceClientProvider),
      ref.read(favouritesRepositoryProvider),
      ref.read(authRepositoryProvider),
      ref.read(chapterUpdatesRepositoryProvider),
    );
  },
);

class MangaDetailsNotifier extends StateNotifier<MangaDetailsState> {
  final SourceClient _source;
  final FavouritesRepository _favourites;
  final AuthRepository _auth;
  final ChapterUpdatesRepository _chapterUpdates;

  StreamSubscription<Favourite?>? _favouriteSubscription;

  MangaDetailsNotifier(
    SourceClient source,
    FavouritesRepository favourites,
    AuthRepository auth,
    ChapterUpdatesRepository chapterUpdates,
  )   : _source = source,
        _favourites = favourites,
        _auth = auth,
        _chapterUpdates = chapterUpdates,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(
    String mangaId,
    Favourite? favourite,
  ) async {
    Manga details;
    ChapterList chapters;

    favourite ??= await _favourites.getFavourite(
      _auth.currentUser,
      _source.src,
      mangaId,
    );

    if (favourite == null) {
      details = await _source.getMangaDetails(mangaId);
      chapters = await _source.getChapters(mangaId);

      state = MangaDetailsState.loaded(details, chapters, null);
    } else {
      _favouriteSubscription = watchFavourite(_source.src, mangaId);
    }
  }

  StreamSubscription<Favourite?> watchFavourite(
    String sourceId,
    String mangaId,
  ) {
    return _favourites
        .watchFavourite(
      _auth.currentUser,
      sourceId,
      mangaId,
    )
        .listen((favourite) async {
      if (favourite == null) {
        final details = await _source.getMangaDetails(mangaId);
        final chapters = await _source.getChapters(mangaId);

        state = MangaDetailsState.loaded(details, chapters, null);
      } else {
        state = MangaDetailsState.loaded(
          favourite.toManga(),
          ChapterList(favourite.chapters).descending(),
          favourite,
        );
      }
    });
  }

  void closeStream() {
    _favouriteSubscription?.cancel();
  }

  Future<void> toggleFavourite(
    String mangaName,
    Manga manga,
    ChapterList chapterList,
  ) async {
    if (!manga.favourite) {
      final favourite = await _favourites.addFavourite(
        _auth.currentUser,
        _source.sourceId,
        mangaName,
        manga,
        chapterList,
      );

      _chapterUpdates.addChapterUpdates(
        _auth.currentUser,
        favourite,
        favourite.chapters,
      );

      state = MangaDetailsState.loaded(
        manga.copyWith(
          favourite: !manga.favourite,
        ),
        chapterList,
        favourite,
      );
    } else {
      final favourite = await _favourites.getFavourite(
        _auth.currentUser,
        _source.src,
        manga.id,
      );

      if (favourite != null) {
        _chapterUpdates.deleteChapterUpdates(
          _auth.currentUser,
          favourite,
        );

        await _favourites.deleteFavourite(
          _auth.currentUser,
          _source.src,
          manga.id,
        );

        state = MangaDetailsState.loaded(
          manga.copyWith(
            favourite: !manga.favourite,
          ),
          chapterList,
          null,
        );
      }
    }
  }

  Future<void> markAsRead(
    Favourite favourite,
    double chapterNumber,
  ) async {
    List<Future> futures = [];

    futures.add(_favourites.markAsRead(
      _auth.currentUser,
      favourite,
      [chapterNumber],
    ));

    futures.add(
      _chapterUpdates.markAsRead(
        _auth.currentUser,
        favourite,
        [chapterNumber],
      ),
    );

    await Future.wait(futures);
  }

  Future<void> markManyAsRead(
    Favourite favourite,
    List<double> chapterNumbers,
  ) async {
    List<Future> futures = [];

    futures.add(_favourites.markAsRead(
      _auth.currentUser,
      favourite,
      chapterNumbers,
    ));

    futures.add(
      _chapterUpdates.markAsRead(
        _auth.currentUser,
        favourite,
        chapterNumbers,
      ),
    );

    await Future.wait(futures);
  }
}
