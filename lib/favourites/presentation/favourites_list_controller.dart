import 'package:collection/collection.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourites_list_controller.g.dart';

final favouritesStreamProvider = StreamProvider<List<Favourite>>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;

    return ref
        .watch(favouritesRepositoryProvider)
        .watchFavourites(user)
        .map((favourites) => sortAndGroup(favourites));
  },
);

@riverpod
FutureOr<Favourite?> favourite(
  Ref ref,
  Source source,
  String mangaId,
) {
  final favourites = ref.watch(favouritesStreamProvider);

  return favourites.whenData((favourites) {
    return favourites.firstWhereOrNull((favourite) {
      return favourite.mangaId == mangaId && favourite.sourceId == source.id;
    });
  }).value;
}

List<Favourite> sortAndGroup(List<Favourite> favourites) {
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
