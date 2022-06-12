// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeSection _$$_HomeSectionFromJson(Map<String, dynamic> json) =>
    _$_HomeSection(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MangaTile.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewMore: json['view_more'] as bool?,
    );

Map<String, dynamic> _$$_HomeSectionToJson(_$_HomeSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'view_more': instance.viewMore,
    };
