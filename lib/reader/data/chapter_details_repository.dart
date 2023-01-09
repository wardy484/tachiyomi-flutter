import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapter_details_repository.g.dart';

@riverpod
FutureOr<ChapterDetails> chapterDetails(
    Ref ref, String mangaId, String chapterId) {
  return ref.read(sourceProvider).getChapterDetails(mangaId, chapterId);
}
