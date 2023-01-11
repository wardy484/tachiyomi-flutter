import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesService {
  final Ref ref;

  FavouritesService({
    required this.ref,
  });

  void toggleFavourite(Source source, String mangaId) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    final favourite = await ref.read(favouriteProvider(source, mangaId).future);

    if (favourite == null) {
      final mangaDetails = await ref.read(
        mangaDetailsControllerProvider(source, mangaId).future,
      );

      await favouritesRepository.addFavourite(
        user,
        source.id,
        mangaDetails.details.titles.first,
        mangaDetails.details,
        mangaDetails.chapters,
      );

      // TODO: Handle all chapter download in thread and make it a setting
      // it chugs and chokes out app
      // ref.read(downloadServiceProvider).downloadChaptersInBackground(
      //       source,
      //       favourite.toManga(),
      //       favourite.chapters,
      //     );
    } else {
      await favouritesRepository.deleteFavourite(
        user,
        source.id,
        mangaId,
      );
    }
  }

  Future<void> markChapterAsRead(
      Favourite favourite, double chapterNumber) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    await favouritesRepository.markAsRead(
      user,
      favourite,
      [chapterNumber],
    );
  }

  void markChapterAsUnread(Favourite favourite, double chapterNumber) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    favouritesRepository.markAsUnread(
      user,
      favourite,
      [chapterNumber],
    );
  }

  void markAllPriorChaptersAsRead(
    Favourite favourite,
    double chapterNumber,
  ) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    final List<double> chaptersToMarkAsRead = favourite.chapters
        .where((chapter) => chapter.chapterNo < chapterNumber)
        .map((chapter) => chapter.chapterNo)
        .toList();

    favouritesRepository.markAsRead(
      user,
      favourite,
      chaptersToMarkAsRead,
    );
  }

  Future<void> setLastRead(
    Favourite favourite,
    Chapter chapter,
    int pageNumber,
  ) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    await favouritesRepository.setLastRead(
      user,
      favourite,
      chapter,
      pageNumber,
    );
  }
}

final favouritesServiceProvider = Provider<FavouritesService>((ref) {
  return FavouritesService(ref: ref);
});
