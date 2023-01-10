import 'package:fluttiyomi/favourites/applications/favourites_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_button_controller.g.dart';

@riverpod
class BookmarkButtonController extends _$BookmarkButtonController {
  @override
  FutureOr<Favourite?> build(String mangaId) {
    return ref.watch(favouriteProvider(mangaId)).value;
  }

  void toggleFavourite(String mangaId) {
    state = const AsyncValue.loading();

    ref.read(favouritesServiceProvider).toggleFavourite(mangaId);
  }
}
