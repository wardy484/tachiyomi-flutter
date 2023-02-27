import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/downloads/application/download_service.dart';
import 'package:fluttiyomi/reader/data/chapter_details_repository.dart';
import 'package:fluttiyomi/reader/presentation/reader_load_state.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reader_pages_controller.g.dart';

final readerIsAppendingProvider = StateProvider<bool>((ref) {
  return false;
});

@riverpod
class ReaderLoadingController extends _$ReaderLoadingController {
  @override
  ReaderLoadState build() {
    return const ReaderLoadState.loading();
  }

  void loaded() {
    state = const ReaderLoadState.loaded();
  }

  void error({String? message}) {
    state = ReaderLoadState.error(message: message);
  }

  void loading() {
    state = const ReaderLoadState.loading();
  }
}

@riverpod
class ReaderPagesController extends _$ReaderPagesController {
  @override
  List<ReaderPageState> build(Source source, String mangaId) {
    return [];
  }

  Future<void> fetchPages(Chapter chapter) async {
    ref.read(readerLoadingControllerProvider).whenOrNull(
          loaded: () =>
              ref.read(readerLoadingControllerProvider.notifier).loading(),
        );

    final chapterDetails =
        await fetchChapterDetails(ref, source, mangaId, chapter.id);

    state = await _precacheImages(
      chapter,
      chapterDetails.pages,
    );

    ref.read(readerLoadingControllerProvider.notifier).loaded();
  }

  Future<void> appendChapterPages(
    Chapter previousChapter,
    Chapter chapter,
  ) async {
    ref.read(readerIsAppendingProvider.notifier).state = true;

    final chapterDetails = await fetchChapterDetails(
      ref,
      source,
      mangaId,
      chapter.id,
    );

    final precachedPages = await _precacheImages(
      chapter,
      chapterDetails.pages,
    );

    state = [
      ...state,
      ReaderPageState(
        url: "page-break",
        chapter: chapter,
        previousChapter: previousChapter,
        totalPages: chapterDetails.pages.length,
        pageNumber: 0,
      ),
      ...precachedPages,
    ];

    ref.read(readerIsAppendingProvider.notifier).state = false;
  }

  Future<List<ReaderPageState>> _precacheImages(
    Chapter chapter,
    List<String> pages,
  ) async {
    final downloadService = ref.read(downloadServiceProvider);

    await downloadService.cachePages(pages);

    return _buildReaderPageStates(chapter, pages);
  }

  List<ReaderPageState> _buildReaderPageStates(
    Chapter chapter,
    List<String> pages,
  ) {
    final List<ReaderPageState> readerPageStates = [];

    for (int i = 0; i < pages.length; i++) {
      readerPageStates.add(ReaderPageState(
        url: pages[i],
        chapter: chapter,
        totalPages: pages.length,
        pageNumber: i + 1,
      ));
    }

    return readerPageStates;
  }
}

class ReaderPageState {
  final String url;
  final Chapter chapter;
  final Chapter? previousChapter;
  final int totalPages;
  final int pageNumber;
  final double? width;
  final double? height;

  ReaderPageState({
    required this.url,
    required this.chapter,
    this.previousChapter,
    required this.totalPages,
    required this.pageNumber,
    this.width,
    this.height,
  });

  String toKey() {
    return "chapterId: ${chapter.id}, pageNumber: $pageNumber, url: $url, width: $width, height: $height";
  }
}
