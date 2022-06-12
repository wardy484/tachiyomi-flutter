import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/firestore/favourite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttiyomi/data/source_data.dart' as source_data;

final favouritesRepositoryProvider = Provider((ref) {
  return FavouritesRepository(
    firestore: FirebaseFirestore.instance,
    authRepository: ref.read(authRepositoryProvider),
  );
});

class FavouritesRepository {
  final FirebaseFirestore db;
  final AuthRepository authRepository;

  FavouritesRepository({
    required FirebaseFirestore firestore,
    required AuthRepository authRepository,
  })  : db = firestore,
        // ignore: prefer_initializing_formals
        authRepository = authRepository;

  Future<List<Favourite>> getFavourites() async {
    final favourites = await db
        .collection("favourites")
        .where("userId", isEqualTo: authRepository.getCurrentUser().id)
        .get();

    return favourites.docs.map((doc) {
      return Favourite.fromJson({
        ...doc.data(),
        "id": doc.id,
        // TODO: Pull through chapters or make them optional
        "chapters": [],
      });
    }).toList();
  }

  Future<bool> isFavourite(String sourceId, String mangaId) async {
    final favourites = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .get();

    return favourites.exists;
  }

  Future<Favourite?> getFavourite(String sourceId, String mangaId) async {
    final favourite = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .get();

    final chapters = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .get();

    final data = favourite.data();

    return data != null
        ? Favourite.fromJson({
            "id": favourite.id,
            ...data,
            "chapters": chapters.docs.map((doc) => doc.data()).toList(),
          })
        : null;
  }

  String buildDocId(String sourceId, String mangaId) {
    final userId = authRepository.getCurrentUser().id;

    return "${userId}_${sourceId}_$mangaId";
  }

  Future<void> addFavourite(
    String sourceId,
    String name,
    Manga manga,
    ChapterList chapterList,
  ) async {
    final docId = buildDocId(sourceId, manga.id);

    db.collection("favourites").doc(docId).set({
      "mangaId": manga.id,
      "userId": authRepository.getCurrentUser().id,
      "sourceId": sourceId,
      "name": name,
      "image": manga.image,
      "newChapterIds": [],
      "titles": manga.titles,
      "rating": manga.rating,
      "status": manga.mangaStatus,
      "langFlag": manga.langFlag,
      "author": manga.author,
      "artist": manga.artist,
      "covers": manga.covers,
      "desc": manga.desc,
      "follows": manga.follows,
      "lastUpdate": manga.lastUpdate,
      // "chapters": chapterList.chapters.map((chapter) {
      //   return chapter.toJson();
      // }).toList(),
      "tagSections": manga.tags?.map((tag) {
            return {
              "id": tag.id,
              "label": tag.label,
              "tags": tag.tags.map((e) => e.toJson()).toList(),
            };
          }).toList() ??
          [],
    });

    for (var chapter in chapterList.chapters) {
      db
          .collection('favourites')
          .doc(docId)
          .collection('chapters')
          .doc(chapter.id)
          .set(chapter.toJson());
    }
  }

  Future<void> addChapters(
    Favourite favourite,
    List<source_data.Chapter> chapters,
  ) async {
    if (chapters.isEmpty) {
      log("No new chapters to add to favourite mangaId: ${favourite.mangaId}, sourceId: ${favourite.sourceId}");
      return;
    }

    final List<source_data.Chapter> newChapters = [
      ...favourite.chapters,
      ...chapters,
    ];

    log("Adding ${chapters.length} new chapters to favourite mangaId: ${favourite.mangaId}, sourceId: ${favourite.sourceId}");

    await db
        .collection("favourites")
        .doc(buildDocId(favourite.sourceId, favourite.mangaId))
        .update({
      ...favourite.toJson(),
      "chapters": newChapters.map((chapter) {
        return chapter.toJson();
      }).toList(),
    });
  }

  Future<void> update(List<Favourite> favourites) async {
    final List<Future> futures = [];

    for (final favourite in favourites) {
      final future = db
          .collection("favourites")
          .doc(buildDocId(favourite.sourceId, favourite.mangaId))
          .update(favourite.toJson());

      futures.add(future);
    }

    await Future.wait(futures);
  }

  Future<void> deleteFavourite(
    String sourceId,
    String mangaId,
  ) async {
    log("Deleting favourite mangaId: $mangaId, sourceId: $sourceId");

    // TODO: Delete chapters too sub-collections probably require a
    // cloud function :sad_face:

    await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .delete();
  }

  Future<void> markManyAsOpened(
    String sourceId,
    String mangaId,
    List<String> chapterIds,
  ) async {
    log("Marking $chapterIds as opened for mangaId: $mangaId, sourceId: $sourceId");
    await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .update({"newChapterIds": FieldValue.arrayRemove(chapterIds)});
  }

  Future<void> setLastChapterRead(
    String sourceId,
    String mangaId,
    source_data.Chapter chapter,
  ) async {
    log("Updating last read chapter for mangaId: $mangaId, sourceId: $sourceId");

    await db
        .collection("favourites")
        .doc(buildDocId(sourceId, mangaId))
        .update({"lastChapterRead": chapter.toJson()});
  }
}
