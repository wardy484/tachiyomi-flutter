import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesStreamProvider = StreamProvider<List<Favourite>>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    log("MangaDetailsController: User");
    return ref
        .watch(favouritesRepositoryProvider)
        .watchFavourites(user)
        .map((favourites) => _sortAndGroup(favourites));
  },
);

final favouriteProvider = FutureProvider.family<Favourite?, String>(
  (ref, mangaId) async {
    final favourites = ref.watch(favouritesStreamProvider);

    return favourites.whenData((favourites) {
      return favourites.firstWhereOrNull((favourite) {
        return favourite.mangaId == mangaId;
      });
    }).value;
  },
);

List<Favourite> _sortAndGroup(List<Favourite> favourites) {
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
