// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagSection _$$_TagSectionFromJson(Map<String, dynamic> json) =>
    _$_TagSection(
      id: json['id'] as String,
      label: json['label'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TagSectionToJson(_$_TagSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };
