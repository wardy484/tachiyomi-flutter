import 'dart:developer';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/downloads/data/download_repository.dart';
import 'package:fluttiyomi/downloads/data/download_state.dart';
import 'package:fluttiyomi/downloads/data/download_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final downloadProvider =
    StateNotifierProvider<DownloadNotifier, DownloadState>((ref) {
  return DownloadNotifier(
    downloads: ref.read(downloadRepositoryProvider),
  );
});

class DownloadNotifier extends StateNotifier<DownloadState> {
  final DownloadRepository downloads;

  DownloadNotifier({
    required this.downloads,
  }) : super(const DownloadState.download(downloads: []));

  void addDownload(Manga manga, Chapter chapter) async {
    log('Adding download for ${manga.titles[0]} - ${chapter.chapterNo}');
    final download = Download()
      ..image = manga.image
      ..mangaName = manga.titles[0]
      ..chapterId = chapter.id
      ..mangaId = manga.id
      ..chapterName = chapter.name ?? chapter.chapterNo.toString();

    await downloads.add(download);
  }

  void retryDownload(Download download) async {
    download.status = DownloadStatus.pending;
    await downloads.update(download);
  }

  void deleteDownload(Download download) async {
    await downloads.delete(download);
  }
}
