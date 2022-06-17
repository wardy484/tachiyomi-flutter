import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final readChaptersRepositoryProvider = Provider((ref) {
  return ReadChaptersRepository(
    firestore: FirebaseFirestore.instance,
    authRepository: ref.read(authRepositoryProvider),
    favouritesRepository: ref.read(favouritesRepositoryProvider),
  );
});

class ReadChaptersRepository {
  final FirebaseFirestore db;
  final AuthRepository _authRepository;
  final FavouritesRepository _favouritesRepository;

  ReadChaptersRepository({
    required FirebaseFirestore firestore,
    required AuthRepository authRepository,
    required FavouritesRepository favouritesRepository,
  })  : db = firestore,
        // ignore: prefer_initializing_formals
        _authRepository = authRepository,
        _favouritesRepository = favouritesRepository;

  Future<ChapterList> getChapters(
    String sourceId,
    String mangaId,
  ) async {
    log("READ: Getting chapters for $mangaId from $sourceId");

    final chapters = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .get();

    return ChapterList(chapters.docs
        .map(
          (doc) => Chapter.fromJson(doc.data()),
        )
        .toList());
  }

  Query<Chapter> getChaptersQuery(
    String sourceId,
    String mangaId,
  ) {
    return db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .withConverter<Chapter>(
          fromFirestore: (snapshot, _) => Chapter.fromJson(snapshot.data()!),
          toFirestore: (chapter, _) => chapter.toJson(),
        );
  }

  Future<Chapter?> getPreviousChapter(
    String sourceId,
    String mangaId,
    double chapNum,
  ) async {
    final chapter = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .where('chapNum', isLessThan: chapNum)
        .withConverter<Chapter>(
          fromFirestore: (snapshot, _) => Chapter.fromJson(snapshot.data()!),
          toFirestore: (chapter, _) => chapter.toJson(),
        )
        .limit(1)
        .get();

    if (chapter.docs.isEmpty) {
      return null;
    }

    return chapter.docs.first.data();
  }

  Future<Chapter?> getNextChapter(
    String sourceId,
    String mangaId,
    double chapNum,
  ) async {
    final chapter = await db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum')
        .where('chapNum', isGreaterThan: chapNum)
        .withConverter<Chapter>(
          fromFirestore: (snapshot, _) => Chapter.fromJson(snapshot.data()!),
          toFirestore: (chapter, _) => chapter.toJson(),
        )
        .limit(1)
        .get();

    if (chapter.docs.isEmpty) {
      return null;
    }

    return chapter.docs.first.data();
  }

  Stream<ChapterList> watchChapters(
    String sourceId,
    String mangaId,
  ) {
    return db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .orderBy('chapNum', descending: true)
        .snapshots()
        .map((snapshot) {
      log("READ: Read chapters from stream");

      final chapters = snapshot.docs.map((doc) {
        return Chapter.fromJson(doc.data());
      }).toList();

      return ChapterList(chapters);
    });
  }

  Future<void> markAsRead(
    String sourceId,
    String chapterId,
    String mangaId,
  ) async {
    log("WRITE: Marking chapter $chapterId as read from $sourceId");

    db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .doc(chapterId)
        .update({"read": true});

    _favouritesRepository.setUnreadChapters(sourceId, mangaId);
  }

  Future<void> markManyAsRead(
    String sourceId,
    String mangaId,
    List<String> chapterIds,
  ) async {
    for (var chapterId in chapterIds) {
      log("WRITE: Marking chapter $chapterId as read from $sourceId");

      db
          .collection('favourites')
          .doc(buildDocId(sourceId, mangaId))
          .collection('chapters')
          .doc(chapterId)
          .update({"read": true});

      _favouritesRepository.setUnreadChapters(sourceId, mangaId);
    }
  }

  Future<void> setLastPage(
    String sourceId,
    String mangaId,
    String chapterId,
    int pageNumber,
  ) async {
    if (pageNumber == 0) {
      return;
    }

    log("WRITE: Setting last page to $pageNumber for $mangaId on $chapterId from $sourceId");

    db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .doc(chapterId)
        .update({"page": pageNumber});
  }

  String buildDocId(String sourceId, String mangaId) {
    final userId = _authRepository.getCurrentUser().id;

    return "${userId}_${sourceId}_$mangaId";
  }
}
