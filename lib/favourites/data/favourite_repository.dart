import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/user.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favouritesRepositoryProvider = Provider((ref) {
  return FavouritesRepository(
    firestore: FirebaseFirestore.instance,
  );
});

class FavouritesRepository {
  final FirebaseFirestore db;

  FavouritesRepository({
    required FirebaseFirestore firestore,
  }) : db = firestore;

  Stream<List<Favourite>> watchFavourites(User user) {
    return db
        .collection("favourites")
        .where("userId", isEqualTo: user.id)
        .snapshots()
        .map((snapshot) {
      log("READ: Got favourites: ${snapshot.docs.length}");

      return snapshot.docs.map((doc) {
        return Favourite.fromJson({
          ...doc.data(),
          "id": doc.id,
        });
      }).toList();
    });
  }

  Future<Favourite?> getFavourite(
      User user, String sourceId, String mangaId) async {
    log("READ: Getting favourite $mangaId from $sourceId");
    DocumentSnapshot<Map<String, dynamic>> favourite;

    try {
      favourite = await _favouriteDocumentQuery(
        user,
        sourceId,
        mangaId,
      ).get();
    } catch (e) {
      log("READ: Error getting favourite $mangaId from $sourceId");
      return null;
    }

    log("READ: Getting chapters for favourite $mangaId from $sourceId");

    final data = favourite.data();

    return data != null
        ? Favourite.fromJson({
            ...data,
            "id": favourite.id,
          })
        : null;
  }

  Future<Favourite> addFavourite(
    User user,
    String sourceId,
    String name,
    Manga manga,
    ChapterList chapterList,
  ) async {
    final docId = _buildFavouriteDocId(user, sourceId, manga.id);

    log("WRITE: Adding favourite $manga.id from $sourceId");

    final latestChapterNumber =
        chapterList.descending().toList().first.chapterNo;

    db.collection("favourites").doc(docId).set({
      "mangaId": manga.id,
      "userId": user.id,
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
      "unreadChapterCount": chapterList.length,
    });

    return await getFavourite(user, sourceId, manga.id) as Favourite;
  }

  Future<void> update(User user, List<Favourite> favourites) async {
    final List<Future> futures = [];

    log("About to update ${favourites.length} favourites");

    for (final favourite in favourites) {
      log("WRITE: Updating favourite ${favourite.mangaId} from ${favourite.sourceId}");

      final future = _favouriteDocumentQuery(
        user,
        favourite.sourceId,
        favourite.mangaId,
      ).update(favourite.toJson());

      futures.add(future);
    }

    await Future.wait(futures);
  }

  Future<void> markAsRead(
    User user,
    Favourite favourite,
    List<double> chapterNumbers,
  ) async {
    log("WRITE: Marking many chapters $chapterNumbers as read from ${favourite.sourceId}");

    List<Chapter> chapters = favourite.chapters.toList();

    for (var i = 0; i < chapters.length; i++) {
      if (chapterNumbers.contains(chapters[i].chapterNo)) {
        chapters[i] = chapters[i].copyWith(
          read: true,
        );
      }
    }

    favourite = favourite.copyWith(
      chapters: chapters,
      unreadChapterCount: _calculateUnreadChapterCount(chapters),
    );

    update(user, [favourite]);
  }

  Future<void> markAsUnread(
    User user,
    Favourite favourite,
    List<double> chapterNumbers,
  ) async {
    log("WRITE: Marking many chapters $chapterNumbers as unread from ${favourite.sourceId}");

    List<Chapter> chapters = favourite.chapters.toList();

    for (var i = 0; i < chapters.length; i++) {
      if (chapterNumbers.contains(chapters[i].chapterNo)) {
        chapters[i] = chapters[i].copyWith(
          read: false,
        );
      }
    }

    favourite = favourite.copyWith(
      chapters: chapters,
      unreadChapterCount: _calculateUnreadChapterCount(chapters),
    );

    update(user, [favourite]);
  }

  Future<void> setLastPage(
    User user,
    Favourite favourite,
    String chapterId,
    int pageNumber,
  ) async {
    if (pageNumber == 0) {
      return;
    }

    log("WRITE: Setting last page to $pageNumber for ${favourite.mangaId} on $chapterId from ${favourite.sourceId}");

    // TODO: Implement a better lastPage read system
    // and probably read system

    // final chapters = favourite.chapters;

    // for (var i = 0; i < chapters.length; i++) {
    //   if (chapters[i].id == chapterId) {
    //     chapters[i] = chapters[i].copyWith(
    //       page: pageNumber,
    //     );
    //     break;
    //   }
    // }

    // favourite = favourite.copyWith(
    //   chapters: chapters,
    // );

    // _favouritesRepository.update([favourite]);
  }

  Future<void> deleteFavourite(
    User user,
    String sourceId,
    String mangaId,
  ) async {
    log("WRITE: Deleting favourite mangaId: $mangaId, sourceId: $sourceId");

    await _favouriteDocumentQuery(user, sourceId, mangaId).delete();
  }

  DocumentReference<Map<String, dynamic>> _favouriteDocumentQuery(
    User user,
    String sourceId,
    String mangaId,
  ) {
    return db
        .collection('favourites')
        .doc(_buildFavouriteDocId(user, sourceId, mangaId));
  }

  String _buildFavouriteDocId(User user, String sourceId, String mangaId) {
    return "${user.id}_${sourceId}_$mangaId";
  }

  int _calculateUnreadChapterCount(List<Chapter> chapters) {
    int unreadChapterCount = 0;
    for (var chapter in chapters) {
      if (!chapter.read) {
        unreadChapterCount++;
      }
    }
    return unreadChapterCount;
  }
}
