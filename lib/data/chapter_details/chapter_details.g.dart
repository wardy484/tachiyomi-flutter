// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterDetails _$$_ChapterDetailsFromJson(Map<String, dynamic> json) =>
    _$_ChapterDetails(
      json['id'] as String,
      json['mangaId'] as String,
      (json['pages'] as List<dynamic>).map((e) => e as String).toList(),
      json['longStrip'] as bool,
    );

Map<String, dynamic> _$$_ChapterDetailsToJson(_$_ChapterDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'pages': instance.pages,
      'longStrip': instance.longStrip,
    };
