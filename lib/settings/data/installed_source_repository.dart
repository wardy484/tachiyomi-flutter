import 'dart:convert';

import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/database/installed_source_model.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final installedSourceRepositoryProvider = Provider((ref) {
  return InstalledSourceRepository(
    database: ref.watch(isarDatabaseProvider).isar,
  );
});

class InstalledSourceRepository {
  final Isar _database;

  InstalledSourceRepository({
    required Isar database,
  }) : _database = database;

  Future<List<InstalledSource>> getInstalledSources() async {
    return await _database.installedSources.where().findAll();
  }

  Stream<List<InstalledSource>> queryInstalledSources() {
    return _database.installedSources.where().watch(fireImmediately: true);
  }

  Future<InstalledSource?> getInstalledSource(String sourceId) async {
    return await _database.installedSources
        .where()
        .filter()
        .sourceIdEqualTo(sourceId)
        .findFirst();
  }

  Future<InstalledSource?> getForFavourite(Favourite favourite) async {
    return await getInstalledSource(favourite.sourceId);
  }

  Future<InstalledSource> addInstalledSource(SourceSchema schema) async {
    InstalledSource installedSource = InstalledSource()
      ..sourceId = schema.info.id
      ..name = schema.info.name
      ..iconPath = schema.info.iconUrl
      ..rawSchema = jsonEncode(schema.toJson());

    await _database.writeTxn(() async {
      await _database.installedSources.put(installedSource);
    });

    return installedSource;
  }

  Future<void> delete(InstalledSource source) async {
    await _database.writeTxn(() async {
      await _database.installedSources.delete(source.id!);
    });
  }
}
