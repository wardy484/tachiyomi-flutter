import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:fluttiyomi/favourites/favourites_repository.dart';
import 'package:fluttiyomi/favourites/favourites_state.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/settings/settings_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>((ref) {
  return FavouritesNotifier(
    ref.watch(favouritesRepositoryProvider),
    ref.watch(settingsRepositoryProvider),
    ref.watch(sourceClientProvider.state).state,
  );
});

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final FavouritesRepository _favourites;
  final SettingsRepository _settings;
  final SourceClient _source;

  FavouritesNotifier(
    FavouritesRepository favourites,
    SettingsRepository settings,
    SourceClient source,
  )   : _favourites = favourites,
        _settings = settings,
        _source = source,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(favourites, false);
  }

  Future<void> checkForUpdates() async {
    Setting settings = await _settings.getGlobalSettings();

    List<Favourite> favourites = await _favourites.getFavourites();

    state = FavouritesState.loaded(favourites, true);

    await _source.checkForUpdates(
      favourites.map<String>((e) => e.mangaId).toList(),
      settings.lastUpdateCheck,
      (updated) {
        favourites.forEach((e) {
          if (updated.contains(e.mangaId)) {
            e.hasNewChapters = true;
          }
        });

        _favourites.update(favourites);
        state = FavouritesState.loaded(favourites, false);
      },
    );

    await _settings.updateGlobalSettings(DateTime.now());
  }

  Future<void> markAsOpened(String sourceId, String mangaId) async {
    Favourite? favourite = await _favourites.getFavourite(sourceId, mangaId);

    if (favourite is Favourite) {
      favourite.hasNewChapters = false;

      _favourites.update([favourite]);
    }
  }
}
