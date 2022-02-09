import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>((ref) {
  return FavouritesNotifier(
    ref.watch(favouritesRepositoryProvider),
  );
});

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final FavouritesRepository _favourites;

  FavouritesNotifier(FavouritesRepository favourites)
      : _favourites = favourites,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(favourites);
  }
}
