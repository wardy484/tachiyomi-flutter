import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapter_details_repository.g.dart';

@riverpod
FutureOr<ChapterDetails> chapterDetails(
    Ref ref, String mangaId, String chapterId) {
  return ref.read(sourceClientProvider).getChapterDetails(mangaId, chapterId);
}
