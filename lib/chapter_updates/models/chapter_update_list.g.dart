// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_update_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterUpdateList _$$_ChapterUpdateListFromJson(Map<String, dynamic> json) =>
    _$_ChapterUpdateList(
      chapterUpdates: (json['chapterUpdates'] as List<dynamic>)
          .map((e) => ChapterUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChapterUpdateListToJson(
        _$_ChapterUpdateList instance) =>
    <String, dynamic>{
      'chapterUpdates': instance.chapterUpdates.map((e) => e.toJson()).toList(),
    };
