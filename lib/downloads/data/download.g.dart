// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Download _$$_DownloadFromJson(Map<String, dynamic> json) => _$_Download(
      manga: Manga.fromJson(json['manga'] as Map<String, dynamic>),
      chapter: Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      status: $enumDecode(_$DownloadStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_DownloadToJson(_$_Download instance) =>
    <String, dynamic>{
      'manga': instance.manga.toJson(),
      'chapter': instance.chapter.toJson(),
      'status': _$DownloadStatusEnumMap[instance.status]!,
    };

const _$DownloadStatusEnumMap = {
  DownloadStatus.pending: 'pending',
  DownloadStatus.downloading: 'downloading',
  DownloadStatus.complete: 'complete',
  DownloadStatus.error: 'error',
};
