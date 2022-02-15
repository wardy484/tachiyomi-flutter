import 'package:fluttiyomi/settings/settings_repository.dart';
import 'package:fluttiyomi/settings/settings_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier(
    settingsRepository: ref.watch(settingsRepositoryProvider),
  );
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsNotifier({
    required this.settingsRepository,
  }) : super(const SettingsState.initial());

  Future<void> loadSettings() async {
    var settings = await settingsRepository.getGlobalSettings();

    state = SettingsState.loaded(settings);
  }

  Future<void> updatePadding(int amount) async {
    settingsRepository.updatePadding(amount);
  }
}
