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
  StreamSubscription<ChapterList>? _chaptersStream;

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

    if (favourite == null) {
      details = await _source.getMangaDetails(mangaId);
      chapters = await _source.getChapters(mangaId);

      state = MangaDetailsState.loaded(details, chapters);
    } else {
      details = await favourite.toManga();

      state = MangaDetailsState.loaded(details, ChapterList([]));

      // _chaptersStream = watchChapters(details, mangaId);
    }
  }

  StreamSubscription<ChapterList> watchChapters(
    Manga mangaDetails,
    String mangaId,
  ) {
    return _chapters
        .watchChapters(_source.sourceId, mangaId)
        .listen((chapters) {
      state = MangaDetailsState.loaded(mangaDetails, chapters);
    });
  }

  void closeStream() {
    _chaptersStream?.cancel();
  }

  Future<void> toggleFavourite(
    String mangaName,
    Manga manga,
    ChapterList chapterList,
  ) async {
    if (!manga.favourite) {
      await _favourites.addFavourite(
        _source.sourceId,
        mangaName,
        manga,
        chapterList,
      );
    } else {
      await _favourites.deleteFavourite(_source.src, manga.id);
    }

    state = MangaDetailsState.loaded(
      manga.copyWith(
        favourite: !manga.favourite,
      ),
      chapterList,
    );
  }

  Future<void> markAsRead(
    String chapterId,
    String mangaId,
  ) async {
    await _chapters.markAsRead(
      _source.src,
      chapterId,
      mangaId,
    );
  }

  Future<void> markManyAsRead(
    String mangaId,
    List<String> chapterIds,
  ) async {
    await _chapters.markManyAsRead(
      _source.src,
      mangaId,
      chapterIds,
    );
  }
}
