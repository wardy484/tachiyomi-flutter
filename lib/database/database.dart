import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/read_chapter.dart';
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
      schemas: [
        FavouriteSchema,
        ReadChapterSchema,
        SettingSchema,
      ],
      directory: dir.path,
    );
  }

  Isar get isar {
    if (!_isarDatabase.isOpen) {
      throw Exception(
        "Database is not open yet, init must be called before use.",
      );
    }

    _isarDatabase.favourites;

    return _isarDatabase;
  }

  IsarCollection<Favourite> get favourites {
    return _isarDatabase.favourites;
  }

  IsarCollection<ReadChapter> get readChapters {
    return _isarDatabase.readChapters;
  }

  IsarCollection<Setting> get settings {
    return _isarDatabase.settings;
  }
}
