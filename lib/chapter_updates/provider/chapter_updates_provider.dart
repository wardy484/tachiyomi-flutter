import 'dart:async';

import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/chapter_updates/models/chapter_update_list.dart';
import 'package:fluttiyomi/chapter_updates/provider/chapter_updates_state.dart';
import 'package:fluttiyomi/chapter_updates/repositories/chapter_updates_repository.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:riverpod/riverpod.dart';

final chapterUpdatesProvider =
    StateNotifierProvider<ChapterUpdates, ChapterUpdatesState>((ref) {
  return ChapterUpdates(
    chapterUpdatesRepository: ref.watch(chapterUpdatesRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
});

class ChapterUpdates extends StateNotifier<ChapterUpdatesState> {
  final ChapterUpdatesRepository chapterUpdatesRepository;
  final AuthRepository authRepository;
  StreamSubscription<ChapterUpdateList>? chapterUpdatesStream;

  ChapterUpdates({
    required this.chapterUpdatesRepository,
    required this.authRepository,
  }) : super(const ChapterUpdatesState.initial());

  Future<void> getChapterUpdates() async {
    chapterUpdatesStream = chapterUpdatesRepository
        .watchChapterUpdates(authRepository.currentUser)
        .listen((ChapterUpdateList chapterUpdates) {
      state = ChapterUpdatesState.loaded(chapterUpdates);
    });
  }

  Future<void> addChapterUpdates(
    Favourite favourite,
    List<Chapter> chapter,
  ) async {
    await chapterUpdatesRepository.addChapterUpdates(
      authRepository.currentUser,
      favourite,
      chapter,
    );
  }

  void closeStream() {
    chapterUpdatesStream?.cancel();
  }
}
