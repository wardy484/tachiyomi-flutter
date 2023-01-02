import 'dart:developer';

import 'package:fluttiyomi/database/models.dart';
import 'package:fluttiyomi/settings/data/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<Setting> build() async {
    return await ref.watch(settingsRepositoryProvider).getGlobalSettings();
  }

  Future<Setting> updatePadding(int padding) async {
    final settings =
        await ref.watch(settingsRepositoryProvider).updatePadding(padding);
    state = AsyncValue.data(settings);

    log("Updated settings - padding: ${settings.padding}");
    return settings;
  }
}
