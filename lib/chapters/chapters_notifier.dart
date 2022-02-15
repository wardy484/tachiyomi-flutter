import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/chapters/chapters_state.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/database/read_chapter.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chaptersNotifierProvider =
    StateNotifierProvider<ChaptersNotifier, ChaptersState>((ref) {
  return ChaptersNotifier(
    ref.read(sourceClientProvider),
    ref.read(readChaptersRepositoryProvider),
  );
});

class ChaptersNotifier extends StateNotifier<ChaptersState> {
  final SourceClient _source;
  final ReadChaptersRepository _readChapters;

  ChaptersNotifier(SourceClient source, ReadChaptersRepository readChapters)
      : _source = source,
        _readChapters = readChapters,
        super(const ChaptersState.initial());

  Future<void> getChapters(String mangaId) async {
    List<ReadChapter> read = await _readChapters.getRead(_source.src, mangaId);
    ChapterList allChapters = await _source.getChapters(mangaId, read);

    state = ChaptersState.loaded(allChapters);
  }
}
