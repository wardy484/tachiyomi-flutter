import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final settingsRepositoryProvider = Provider((ref) {
  return SettingsRepository(
    settings: ref.watch(isarDatabaseProvider).settings,
    database: ref.watch(isarDatabaseProvider).isar,
  );
});

class SettingsRepository {
  final IsarCollection<Setting> _settings;
  final Isar _database;

  SettingsRepository({
    required IsarCollection<Setting> settings,
    required Isar database,
  })  : _settings = settings,
        _database = database;

  Future<Setting> getGlobalSettings() async {
    Setting? setting = await _settings.where().findFirst();

    if (setting is Setting) {
      return setting;
    }

    return await initGlobalSettings();
  }

  Future<Setting> initGlobalSettings() async {
    final settings = Setting()
      ..type = SettingsType.global
      ..lastUpdateCheck = DateTime.now()
      ..padding = 0;

    await _database.writeTxn((_) async {
      await _settings.put(settings);
    });

    return settings;
  }

  Future<Setting> updateGlobalSettings(
    DateTime lastCheckAt,
  ) async {
    final settings = await getGlobalSettings();
    settings.lastUpdateCheck = lastCheckAt;

    await _database.writeTxn((_) async {
      await _settings.put(settings, replaceOnConflict: true);
    });

    return settings;
  }

  Future<Setting> updatePadding(
    int padding,
  ) async {
    final settings = await getGlobalSettings();
    settings.padding = padding;

    await _database.writeTxn((_) async {
      await _settings.put(settings, replaceOnConflict: true);
    });

    return settings;
  }

  Future<Setting> updateShowFps(
    bool showFps,
  ) async {
    final settings = await getGlobalSettings();
    settings.showFps = showFps;

    await _database.writeTxn((_) async {
      await _settings.put(settings, replaceOnConflict: true);
    });

    return settings;
  }
}
