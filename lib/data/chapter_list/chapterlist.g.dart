// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapterlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterList _$$_ChapterListFromJson(Map<String, dynamic> json) =>
    _$_ChapterList(
      (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChapterListToJson(_$_ChapterList instance) =>
    <String, dynamic>{
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
    };
