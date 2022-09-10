import 'dart:isolate';

import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'models/download.dart';

part 'download_state.freezed.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.download({
    required List<Download> downloads,
    FlutterIsolate? isolate,
    SendPort? sendPort,
  }) = _Downloading;
}
