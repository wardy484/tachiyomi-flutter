import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

class Favourites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  TextColumn get mangaId => text()();
  TextColumn get name => text()();
  TextColumn get image => text()();
}

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

@DriftDatabase(tables: [Favourites, CompletedChapters])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 3;

  Future<int> addFavourite(String source, String mangaName, Manga manga) async {
    return await into(favourites).insert(
      FavouritesCompanion(
        mangaId: Value(manga.id),
        source: Value(source),
        name: Value(mangaName),
        image: Value(manga.image),
      ),
    );
  }

  Future<List<Favourite>> getFavourites() async {
    return await select(favourites).get();
  }

  Future<int> deleteFavourite(String source, Manga manga) async {
    return await (delete(favourites)
          ..where((t) => t.source.equals(source))
          ..where((t) => t.mangaId.equals(manga.id)))
        .go();
  }

  Future<bool> isFavourite(String source, String mangaId) async {
    final favourite = await (select(favourites)
          ..where((t) => t.source.equals(source))
          ..where((t) => t.mangaId.equals(mangaId)))
        .getSingleOrNull();

    return favourite != null;
  }

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

final databaseProvider = Provider((ref) {
  return MyDatabase();
});
