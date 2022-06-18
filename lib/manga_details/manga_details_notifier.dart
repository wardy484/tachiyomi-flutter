import 'dart:async';

import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
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
      ref.read(readChaptersRepositoryProvider),
    );
  },
);

class MangaDetailsNotifier extends StateNotifier<MangaDetailsState> {
  final SourceClient _source;
  final FavouritesRepository _favourites;
  final ReadChaptersRepository _chapters;
  StreamSubscription<Favourite?>? _favouriteSubscription;

  MangaDetailsNotifier(
    SourceClient source,
    FavouritesRepository favourites,
    ReadChaptersRepository chapters,
  )   : _source = source,
        _favourites = favourites,
        _chapters = chapters,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(
    String mangaId,
    Favourite? favourite,
  ) async {
    Manga details;
    ChapterList chapters;

    favourite ??= await _favourites.getFavourite(
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
        .watchFavourite(sourceId, mangaId)
        .listen((favourite) async {
      if (favourite == null) {
        final details = await _source.getMangaDetails(mangaId);
        final chapters = await _source.getChapters(mangaId);

        state = MangaDetailsState.loaded(details, chapters, null);
      } else {
        state = MangaDetailsState.loaded(
          favourite.toManga(),
          ChapterList(favourite.chapters),
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
        _source.sourceId,
        mangaName,
        manga,
        chapterList,
      );

      state = MangaDetailsState.loaded(
        manga.copyWith(
          favourite: !manga.favourite,
        ),
        chapterList,
        favourite,
      );
    } else {
      await _favourites.deleteFavourite(_source.src, manga.id);

      state = MangaDetailsState.loaded(
        manga.copyWith(
          favourite: !manga.favourite,
        ),
        chapterList,
        null,
      );
    }
  }

  Future<void> markAsRead(
    Favourite favourite,
    double chapterNumber,
  ) async {
    await _chapters.markAsRead(favourite, chapterNumber);
  }

  Future<void> markManyAsRead(
    Favourite favourite,
    List<double> chpaterNumbers,
  ) async {
    await _chapters.markManyAsRead(
      favourite,
      chpaterNumbers,
    );
  }
}
