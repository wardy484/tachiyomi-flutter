import 'package:fluttiyomi/database/favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_state.freezed.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.initial() = _Initial;
  const factory FavouritesState.loaded(List<Favourite> favourites) = _Loaded;
}
