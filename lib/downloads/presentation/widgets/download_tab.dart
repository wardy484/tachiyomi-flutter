import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/downloads/data/download_repository.dart';
import 'package:fluttiyomi/downloads/data/download_status.dart';
import 'package:fluttiyomi/downloads/presentation/download_notifier.dart';
import 'package:fluttiyomi/favourites/data/favourite_repository.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:fluttiyomi/widgets/common/context_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DownloadsTab extends ConsumerStatefulWidget {
  const DownloadsTab({Key? key}) : super(key: key);

  @override
  _DownloadsTabState createState() => _DownloadsTabState();
}

class _DownloadsTabState extends ConsumerState<DownloadsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: ref.watch(allDownloadsProvider).when(
            data: (downloads) => ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final download = downloads[index];

                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ExtendedImage.network(
                        download.image,
                        cache: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(download.mangaName),
                  subtitle: Text(download.chapterId),
                  trailing: Text(getStatus(download.status)),
                  onTap: () async {
                    if (download.status != DownloadStatus.complete) {
                      return;
                    }

                    final source = ref
                        .read(sourceContainerProvider)
                        .get(download.sourceId);

                    ref.read(authNotifierProvider).whenOrNull(
                      authenticated: (user) async {
                        final favourite = await ref
                            .read(favouritesRepositoryProvider)
                            .getFavourite(
                              user.id,
                              source.id,
                              download.mangaId,
                            );

                        if (favourite != null) {
                          final chapters = ChapterList(favourite.chapters);
                          final chapter = chapters.getByChapterId(
                            download.chapterId,
                          );

                          final source = ref
                              .read(sourceContainerProvider)
                              .get(download.sourceId);

                          await AutoRouter.of(context).push(
                            ReaderRoute(
                              source: source,
                              mangaId: download.mangaId,
                              chapter: chapter,
                            ),
                          );
                        }
                      },
                    );
                  },
                  onLongPress: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ContextMenu(
                          children: [
                            ContextMenuItem(
                              icon: FontAwesomeIcons.arrowsRotate,
                              onPressed: () {
                                ref
                                    .read(downloadProvider.notifier)
                                    .retryDownload(download);
                              },
                            ),
                            ContextMenuItem(
                              icon: FontAwesomeIcons.trash,
                              onPressed: () {
                                ref
                                    .read(downloadProvider.notifier)
                                    .deleteDownload(download);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
          ),
    );
  }

  String getStatus(DownloadStatus downloadStatus) {
    switch (downloadStatus) {
      case DownloadStatus.downloading:
        return "Downloading";
      case DownloadStatus.pending:
        return "Pending";
      case DownloadStatus.complete:
        return "Completed";
      case DownloadStatus.error:
        return "Error";
    }
  }
}
