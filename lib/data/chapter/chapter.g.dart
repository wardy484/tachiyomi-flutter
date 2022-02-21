// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      json['id'] as String,
      json['mangaId'] as String,
      (json['chapNum'] as num).toDouble(),
      json['langCode'] as String,
      json['name'] as String?,
      json['volume'] as String?,
      json['group'] as String?,
      json['time'] as String?,
      read: json['read'] as bool? ?? false,
      page: json['page'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'chapNum': instance.chapterNo,
      'langCode': instance.langCode,
      'name': instance.name,
      'volume': instance.volume,
      'group': instance.group,
      'time': instance.time,
      'read': instance.read,
      'page': instance.page,
    };
