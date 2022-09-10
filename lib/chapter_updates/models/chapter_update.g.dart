// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterUpdate _$$_ChapterUpdateFromJson(Map<String, dynamic> json) =>
    _$_ChapterUpdate(
      sourceId: json['sourceId'] as String,
      mangaId: json['mangaId'] as String,
      chapterNumber: (json['chapterNumber'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
      read: json['read'] as bool,
    );

Map<String, dynamic> _$$_ChapterUpdateToJson(_$_ChapterUpdate instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'mangaId': instance.mangaId,
      'chapterNumber': instance.chapterNumber,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'addedAt': instance.addedAt.toIso8601String(),
      'read': instance.read,
    };
