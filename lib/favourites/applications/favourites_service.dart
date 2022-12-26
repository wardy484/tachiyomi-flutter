import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesService {
  final Ref ref;

  FavouritesService({
    required this.ref,
  });

  void toggleFavourite(String mangaId) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    final favourite = await ref.read(favouriteProvider(mangaId).future);

    if (favourite == null) {
      final mangaDetails = await ref.read(
        mangaDetailsControllerProvider(mangaId).future,
      );

      await favouritesRepository.addFavourite(
        user,
        ref.read(sourceClientProvider).src,
        mangaDetails.details.titles.first,
        mangaDetails.details,
        mangaDetails.chapters,
      );
    } else {
      await favouritesRepository.deleteFavourite(
        user,
        ref.read(sourceClientProvider).src,
        mangaId,
      );
    }
  }

  void markChapterAsRead(Favourite favourite, double chapterNumber) async {
    final favouritesRepository = ref.watch(favouritesRepositoryProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;

    favouritesRepository.markAsRead(
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
}

final favouritesServiceProvider = Provider<FavouritesService>((ref) {
  return FavouritesService(ref: ref);
});
