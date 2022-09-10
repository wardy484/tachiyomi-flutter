import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/downloads/download_notifier.dart';
import 'package:fluttiyomi/downloads/models/download_status.dart';

class DownloadsTab extends ConsumerWidget {
  const DownloadsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ref.watch(downloadProvider).when(
            download: (downloads, _, __) => ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final download = downloads[index];
                final chapter = download.chapter;
                final manga = download.manga;
                final name = manga.titles[0];

                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ExtendedImage.network(
                        manga.image,
                        cache: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(name),
                  subtitle: Text(chapter.name.toString()),
                  trailing: Text(getStatus(download.status)),
                );
              },
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
    }
  }
}
