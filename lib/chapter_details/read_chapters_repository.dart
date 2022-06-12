import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final readChaptersRepositoryProvider = Provider((ref) {
  return ReadChaptersRepository(
    firestore: FirebaseFirestore.instance,
    authRepository: ref.read(authRepositoryProvider),
  );
});

class ReadChaptersRepository {
  final FirebaseFirestore db;
  final AuthRepository authRepository;

  ReadChaptersRepository({
    required FirebaseFirestore firestore,
    required AuthRepository authRepository,
  })  : db = firestore,
        // ignore: prefer_initializing_formals
        authRepository = authRepository;

  Future<void> markAsRead(
    String sourceId,
    String chapterId,
    String mangaId,
  ) async {
    db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .doc(chapterId)
        .update({"read": true});
  }

  Future<void> markManyAsRead(
    String sourceId,
    String mangaId,
    List<String> chapterIds,
  ) async {
    for (var chapterId in chapterIds) {
      db
          .collection('favourites')
          .doc(buildDocId(sourceId, mangaId))
          .collection('chapters')
          .doc(chapterId)
          .update({"read": true});
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

    db
        .collection('favourites')
        .doc(buildDocId(sourceId, mangaId))
        .collection('chapters')
        .doc(chapterId)
        .update({"page": pageNumber});
  }

  String buildDocId(String sourceId, String mangaId) {
    final userId = authRepository.getCurrentUser().id;

    return "${userId}_${sourceId}_$mangaId";
  }
}
