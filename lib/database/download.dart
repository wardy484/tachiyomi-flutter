import 'package:fluttiyomi/database/download_status_converter.dart';
import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:isar/isar.dart';

part 'download.g.dart';

@Collection()
class Download {
  @Id()
  int? id;

  @DownloadStatusConverter()
  DownloadStatus status = DownloadStatus.pending;

  late String mangaName;

  late String mangaId;

  late String image;

  late String chapterId;

  late String chapterName;

  late DateTime createdAt;

  late DateTime updatedAt;
}
