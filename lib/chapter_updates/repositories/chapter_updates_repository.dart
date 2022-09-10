import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/user.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/chapter_updates/models/chapter_update.dart';
import 'package:fluttiyomi/chapter_updates/models/chapter_update_list.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/favourite.dart';

final chapterUpdatesRepositoryProvider = Provider<ChapterUpdatesRepository>(
  (ref) {
    return ChapterUpdatesRepository(
      db: FirebaseFirestore.instance,
    );
  },
);

class ChapterUpdatesRepository {
  final FirebaseFirestore db;

  ChapterUpdatesRepository({
    required this.db,
  });

  Stream<ChapterUpdateList> watchChapterUpdates(User user) {
    return db
        .collection("chapter_updates")
        .doc(user.id)
        .snapshots()
        .map((snapshot) {
      log("READ: Got chapter updates");

      return ChapterUpdateList.fromJson(
        snapshot.data() ??
            {
              "chapterUpdates": [],
            },
      );
    });
  }

  Future<ChapterUpdateList> getChapterUpdates(User user) async {
    final snapshot = await db.collection("chapter_updates").doc(user.id).get();

    return ChapterUpdateList.fromJson(
      snapshot.data() ??
          {
            "chapterUpdates": [],
          },
    );
  }

  Future<void> addChapterUpdates(
    User user,
    Favourite favourite,
    List<Chapter> chapter,
  ) async {
    ChapterUpdateList chapterUpdates = await getChapterUpdates(user);

    for (Chapter chapter in chapter) {
      chapterUpdates = chapterUpdates.copyWith(chapterUpdates: [
        ChapterUpdate(
          sourceId: favourite.sourceId,
          mangaId: favourite.mangaId,
          chapterNumber: chapter.chapterNo,
          imagePath: favourite.image,
          name: favourite.name,
          addedAt: DateTime.now(),
          read: false,
        ),
        ...chapterUpdates.chapterUpdates,
      ]);
    }

    await db
        .collection("chapter_updates")
        .doc(user.id)
        .set(chapterUpdates.toJson());
  }

  Future<void> deleteChapterUpdates(
    User user,
    Favourite favourite,
  ) async {
    ChapterUpdateList chapterUpdates = await getChapterUpdates(user);

    chapterUpdates = chapterUpdates.copyWith(
      chapterUpdates: chapterUpdates.chapterUpdates
          .where((chapterUpdate) =>
              chapterUpdate.sourceId != favourite.sourceId &&
              chapterUpdate.mangaId != favourite.mangaId)
          .toList(),
    );

    return db
        .collection("chapter_updates")
        .doc(user.id)
        .set(chapterUpdates.toJson());
  }

  Future<void> markAsRead(
    User user,
    Favourite favourite,
    List<double> chapterNumbers,
  ) async {
    log("WRITE: Marking many chapter updates $chapterNumbers as read from ${favourite.sourceId}");

    log("Refreshing favourite ${favourite.id}");

    ChapterUpdateList chapterUpdateList = await getChapterUpdates(user);

    List<ChapterUpdate> chapterUpdates =
        chapterUpdateList.chapterUpdates.toList();

    for (var i = 0; i < chapterUpdates.length; i++) {
      if (chapterNumbers.contains(chapterUpdates[i].chapterNumber)) {
        chapterUpdates[i] = chapterUpdates[i].copyWith(
          read: true,
        );
      }
    }

    chapterUpdateList = chapterUpdateList.copyWith(
      chapterUpdates: chapterUpdates,
    );

    await db
        .collection("chapter_updates")
        .doc(user.id)
        .set(chapterUpdateList.toJson());
  }
}
