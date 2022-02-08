import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>((ref) {
  return FavouritesNotifier(
    ref.watch(databaseProvider),
  );
});

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final MyDatabase _database;

  FavouritesNotifier(MyDatabase database)
      : _database = database,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _database.getFavourites();

    state = FavouritesState.loaded(favourites);
  }
}
