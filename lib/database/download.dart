import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:isar/isar.dart';

part 'download.g.dart';

@Collection()
class Download {
  @Id()
  int? id;

  DownloadStatus padding = DownloadStatus.pending;

  late String mangaName;

  late String chapterId;

  late String mangaImageUrl;
}
