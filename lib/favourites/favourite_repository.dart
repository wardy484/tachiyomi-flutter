import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesRepositoryProvider = Provider((ref) {
  return FavouritesRepository(
    firestore: FirebaseFirestore.instance,
    authRepository: ref.read(authRepositoryProvider),
  );
});

class FavouritesRepository {
  final FirebaseFirestore db;
  final AuthRepository _authRepository;

  FavouritesRepository({
    required FirebaseFirestore firestore,
    required AuthRepository authRepository,
  })  : db = firestore,
        // ignore: prefer_initializing_formals
        _authRepository = authRepository;

  Stream<List<Favourite>> watchFavourites() {
    return db
        .collection("favourites")
        .where("userId", isEqualTo: _authRepository.getCurrentUser().id)
        .snapshots()
        .map((snapshot) {
      log("READ: Got favourites");

      return snapshot.docs.map((doc) {
        return Favourite.fromJson({
          ...doc.data(),
          "id": doc.id,
          "chapters": doc.data()["chapters"].map((chapter) {
            return Chapter.fromJson(chapter);
          }).toList(),
        });
      }).toList();
    });
  }

  Future<bool> isFavourite(String sourceId, String mangaId) async {
    log("READ: Checking if manga is favourite $mangaId from $sourceId");
    final favourites = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .get();

    return favourites.exists;
  }

  Future<Favourite?> getFavourite(String sourceId, String mangaId) async {
    log("READ: Getting favourite $mangaId from $sourceId");
    final favourite = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .get();

    log("READ: Getting chapters for favourite $mangaId from $sourceId");

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
    final userId = _authRepository.getCurrentUser().id;

    return "${userId}_${sourceId}_$mangaId";
  }

  Future<void> addFavourite(
    String sourceId,
    String name,
    Manga manga,
    ChapterList chapterList,
  ) async {
    final docId = buildDocId(sourceId, manga.id);

    log("WRITE: Adding favourite $manga.id from $sourceId");
    final latestChapterNumber =
        chapterList.descending().toList().first.chapterNo;

    db.collection("favourites").doc(docId).set({
      "mangaId": manga.id,
      "userId": _authRepository.getCurrentUser().id,
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
      "chapters": chapterList.chapters.map((chapter) {
        return chapter.toJson();
      }).toList(),
      "tagSections": manga.tags?.map((tag) {
            return {
              "id": tag.id,
              "label": tag.label,
              "tags": tag.tags.map((e) => e.toJson()).toList(),
            };
          }).toList() ??
          [],
      "latestChapterNumber": latestChapterNumber,
    });

    log("Adding chapters (${chapterList.chapters.length}) for favourite $manga.id from $sourceId");

    for (var chapter in chapterList.chapters) {
      log("WRITE: Adding chapter ${chapter.chapterNo} for favourite $manga.id from $sourceId");

      db
          .collection('favourites')
          .doc(docId)
          .collection('chapters')
          .doc(chapter.id)
          .set(chapter.toJson());
    }
  }

  Future<void> setUnreadChapters(
    String sourceId,
    String mangaId,
  ) async {
    final docId = buildDocId(sourceId, mangaId);

    log("WRITE: Setting unread chapters for favourite $mangaId from $sourceId");

    final chapters = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .where('read', isEqualTo: false)
        .get();

    final chapterlist = ChapterList(chapters.docs
        .map(
          (doc) => Chapter.fromJson(doc.data()),
        )
        .toList());

    db.collection('favourites').doc(docId).update({
      "unreadChapterCount": chapterlist.length,
    });
  }

  Future<void> addChapters(
    Favourite favourite,
    List<Chapter> chapters,
  ) async {
    if (chapters.isEmpty) {
      log("No new chapters to add to favourite mangaId: ${favourite.mangaId}, sourceId: ${favourite.sourceId}");
      return;
    }

    log("Adding ${chapters.length} new chapters to favourite mangaId: ${favourite.mangaId}, sourceId: ${favourite.sourceId}");

    for (var chapter in chapters) {
      log("WRITE: Adding chapter ${chapter.chapterNo} to favourite mangaId: ${favourite.mangaId}, sourceId: ${favourite.sourceId}");

      await db
          .collection('favourites')
          .doc(buildDocId(favourite.sourceId, favourite.mangaId))
          .collection('chapters')
          .doc(chapter.id)
          .set(chapter.toJson());
    }
  }

  Future<void> update(List<Favourite> favourites) async {
    final List<Future> futures = [];

    log("About to update ${favourites.length} favourites");

    for (final favourite in favourites) {
      log("WRITE: Updating favourite ${favourite.mangaId} from ${favourite.sourceId}");

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
    log("WRITE: Deleting favourite mangaId: $mangaId, sourceId: $sourceId");

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
    log("WRITE: Marking $chapterIds as opened for mangaId: $mangaId, sourceId: $sourceId");

    await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .update({"newChapterIds": FieldValue.arrayRemove(chapterIds)});
  }

  Future<void> setLastChapterRead(
    String sourceId,
    String mangaId,
    Chapter chapter,
  ) async {
    log("WRITE: Updating last read chapter for mangaId: $mangaId, sourceId: $sourceId");

    await db
        .collection("favourites")
        .doc(buildDocId(sourceId, mangaId))
        .update({"lastChapterRead": chapter.toJson()});
  }

  Future<void> setLatestChapter(
    String sourceId,
    String mangaId,
    double latestChapterNumber,
  ) async {
    log("WRITE: Updating latestChapterNumber for mangaId: $mangaId, sourceId: $sourceId");

    await db
        .collection("favourites")
        .doc(buildDocId(sourceId, mangaId))
        .update({"latestChapterNumber": latestChapterNumber});
  }
}
