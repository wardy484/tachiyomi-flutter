import 'package:fluttiyomi/favourites/applications/favourites_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_button_controller.g.dart';

@riverpod
class BookmarkButtonController extends _$BookmarkButtonController {
  @override
  FutureOr<Favourite?> build(Source source, String mangaId) {
    return ref.watch(favouriteProvider(source, mangaId)).value;
  }

  void toggleFavourite(String mangaId) {
    state = const AsyncValue.loading();

    ref.read(favouritesServiceProvider).toggleFavourite(source, mangaId);
  }
}
