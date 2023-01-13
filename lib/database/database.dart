import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/database/chapter_details_model.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/database/installed_source_model.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final isarDatabaseProvider = Provider((_) => Database());

class Database {
  late final Isar _isarDatabase;

  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();

    _isarDatabase = await Isar.open(
      [
        SettingSchema,
        DownloadSchema,
        InstalledSourceSchema,
        ChapterDetailsCacheSchema,
      ],
      directory: dir.path,
      inspector: kDebugMode,
    );
  }

  Isar get isar {
    if (!_isarDatabase.isOpen) {
      throw Exception(
        "Database is not open yet, init must be called before use.",
      );
    }

    return _isarDatabase;
  }

  IsarCollection<Setting> get settings {
    return _isarDatabase.settings;
  }
}
