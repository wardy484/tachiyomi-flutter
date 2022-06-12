import 'package:fluttiyomi/favourites/firestore/favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_state.freezed.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.initial() = _Initial;
  const factory FavouritesState.loaded(
    List<Favourite> favourites,
    bool checkingForUpdates,
  ) = _Loaded;
}
