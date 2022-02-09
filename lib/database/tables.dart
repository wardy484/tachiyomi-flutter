import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

class CompletedChapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  TextColumn get mangaId => text()();
  TextColumn get chapterId => text()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

final databaseProvider = Provider((_) => MyDatabase());

@DriftDatabase(tables: [CompletedChapters])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 3;

  Future<int> markAsRead(
    String source,
    String mangaId,
    String chapterId,
  ) async {
    return await into(completedChapters).insert(CompletedChaptersCompanion(
      source: Value(source),
      mangaId: Value(mangaId),
      chapterId: Value(chapterId),
    ));
  }

  Future<List<CompletedChapter>> getRead(String source, String mangaId) async {
    return await (select(completedChapters)
          ..where((t) => t.source.equals(source))
          ..where((t) => t.mangaId.equals(mangaId)))
        .get();
  }
}
