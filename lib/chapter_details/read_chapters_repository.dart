import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
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
    Favourite favourite,
  ) async {
    return ChapterList(favourite.chapters);
  }

  Future<void> markAsRead(
    Favourite favourite,
    double chapterNumber,
  ) async {
    log("WRITE: Marking chapter $chapterNumber as read from ${favourite.sourceId}");

    log("Refreshing favourite ${favourite.id}");
    Favourite? freshFavourite = await _favouritesRepository.getFavourite(
      favourite.sourceId,
      favourite.mangaId,
    );

    if (freshFavourite == null) {
      log("Favourite not found ${favourite.sourceId}/${favourite.mangaId}");
      return;
    }

    List<Chapter> chapters = freshFavourite.chapters.toList();

    for (var i = 0; i < chapters.length; i++) {
      if (chapters[i].chapterNo == chapterNumber) {
        chapters[i] = chapters[i].copyWith(
          read: true,
        );
        break;
      }
    }

    freshFavourite = freshFavourite.copyWith(
      chapters: chapters,
      unreadChapterCount: calculateUnreadChapterCount(chapters),
    );

    _favouritesRepository.update([freshFavourite]);
  }

  Future<void> markManyAsRead(
    Favourite favourite,
    List<double> chapterNumbers,
  ) async {
    log("WRITE: Marking many chapters $chapterNumbers as read from ${favourite.sourceId}");

    log("Refreshing favourite ${favourite.id}");
    Favourite? freshFavourite = await _favouritesRepository.getFavourite(
      favourite.sourceId,
      favourite.mangaId,
    );

    if (freshFavourite == null) {
      log("Favourite not found ${favourite.sourceId}/${favourite.mangaId}");
      return;
    }

    List<Chapter> chapters = freshFavourite.chapters.toList();

    for (var i = 0; i < chapters.length; i++) {
      if (chapterNumbers.contains(chapters[i].chapterNo)) {
        chapters[i] = chapters[i].copyWith(
          read: true,
        );
      }
    }

    freshFavourite = freshFavourite.copyWith(
      chapters: chapters,
      unreadChapterCount: calculateUnreadChapterCount(chapters),
    );

    _favouritesRepository.update([freshFavourite]);
  }

  int calculateUnreadChapterCount(List<Chapter> chapters) {
    int unreadChapterCount = 0;
    for (var chapter in chapters) {
      if (!chapter.read) {
        unreadChapterCount++;
      }
    }
    return unreadChapterCount;
  }

  Future<void> setLastPage(
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

  String buildDocId(String sourceId, String mangaId) {
    final userId = _authRepository.getCurrentUser().id;

    return "${userId}_${sourceId}_$mangaId";
  }
}
