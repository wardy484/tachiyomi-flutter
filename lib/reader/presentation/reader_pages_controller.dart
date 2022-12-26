import 'package:async/async.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/data/chapter_details_repository.dart';
import 'package:fluttiyomi/reader/presentation/reader_load_state.dart';
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
  List<ReaderPage> build(String mangaId) {
    return [];
  }

  Future<void> fetchPages(Chapter chapter) async {
    ref.read(readerLoadingControllerProvider).whenOrNull(
          loaded: () =>
              ref.read(readerLoadingControllerProvider.notifier).loading(),
        );

    final chapterDetails = await ref.watch(
      chapterDetailsProvider(mangaId, chapter.id).future,
    );

    state = await _precacheImages(chapter, chapterDetails.pages);

    ref.read(readerLoadingControllerProvider.notifier).loaded();
  }

  Future<void> appendChapterPages(Chapter chapter) async {
    ref.read(readerIsAppendingProvider.notifier).state = true;

    final chapterDetails = await ref.watch(
      chapterDetailsProvider(mangaId, chapter.id).future,
    );

    final precachedPages = await _precacheImages(chapter, chapterDetails.pages);

    state = [...state, ...precachedPages];

    ref.read(readerIsAppendingProvider.notifier).state = false;
  }

  Future<List<ReaderPage>> _precacheImages(
    Chapter chapter,
    List<String> pages,
  ) async {
    FutureGroup futures = FutureGroup<FileInfo>();

    for (final page in pages) {
      futures.add(DefaultCacheManager().downloadFile(page));
    }

    futures.close();
    await futures.future;

    return _buildReaderPages(chapter, pages);
  }

  List<ReaderPage> _buildReaderPages(Chapter chapter, List<String> pages) {
    final List<ReaderPage> readerPages = [];

    for (int i = 0; i < pages.length; i++) {
      readerPages.add(ReaderPage(
        url: pages[i],
        chapter: chapter,
        pageNumber: i + 1,
      ));
    }

    return readerPages;
  }
}

class ReaderPage {
  final String url;
  final Chapter chapter;
  final int pageNumber;
  final double? width;
  final double? height;

  ReaderPage({
    required this.url,
    required this.chapter,
    required this.pageNumber,
    this.width,
    this.height,
  });

  String toKey() {
    return "chapterId: ${chapter.id}, pageNumber: $pageNumber, url: $url, width: $width, height: $height";
  }
}
