import 'package:fluttiyomi/downloads/models/download_status.dart';
import 'package:isar/isar.dart';

class DownloadStatusConverter extends TypeConverter<DownloadStatus, int> {
  const DownloadStatusConverter();

  @override
  DownloadStatus fromIsar(int object) {
    return DownloadStatus.values[object];
  }

  @override
  int toIsar(DownloadStatus object) {
    return object.index;
  }
}
