import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/downloads/data/download_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download.freezed.dart';
part 'download.g.dart';

@freezed
class Download with _$Download {
  factory Download({
    required Manga manga,
    required Chapter chapter,
    required DownloadStatus status,
  }) = _Download;

  factory Download.fromJson(Map<String, dynamic> json) =>
      _$DownloadFromJson(json);
}
