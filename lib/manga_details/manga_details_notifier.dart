import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/manga_details_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mangaDetailsNotifierProvider =
    StateNotifierProvider.autoDispose<MangaDetailsNotifier, MangaDetailsState>(
  (ref) {
    return MangaDetailsNotifier(
      ref.read(sourceClientProvider),
      ref.read(favouritesRepositoryProvider),
    );
  },
);

class MangaDetailsNotifier extends StateNotifier<MangaDetailsState> {
  final SourceClient _source;
  final FavouritesRepository _favourites;

  MangaDetailsNotifier(SourceClient source, FavouritesRepository favourites)
      : _source = source,
        _favourites = favourites,
        super(const MangaDetailsState.initial());

  Future<void> getMangaDetails(
    String sourceId,
    String mangaId,
  ) async {
    Favourite? favourite = await _favourites.getFavourite(sourceId, mangaId);
    Manga details;
    ChapterList chapters;

    if (favourite == null) {
      details = await _source.getMangaDetails(mangaId);
      chapters = await _source.getChapters(mangaId);
    } else {
      details = favourite.toManga();
      chapters = await favourite.getChapterList();
    }

    state = MangaDetailsState.loaded(details, chapters);
  }

  Future<void> toggleFavourite(
    String mangaName,
    Manga manga,
    ChapterList chapterList,
  ) async {
    if (!manga.favourite) {
      await _favourites.addFavourite(
        _source.src,
        mangaName,
        manga,
        chapterList,
      );
    } else {
      await _favourites.deleteFavourite(_source.src, manga);
    }

    state = MangaDetailsState.loaded(
      manga.copyWith(
        favourite: !manga.favourite,
      ),
      chapterList,
    );
  }
}
