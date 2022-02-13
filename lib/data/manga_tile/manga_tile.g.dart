// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MangaTile _$$_MangaTileFromJson(Map<String, dynamic> json) => _$_MangaTile(
      id: json['id'] as String,
      title: IconText.fromJson(json['title'] as Map<String, dynamic>),
      image: json['image'] as String,
      subtitleText: json['subtitleText'] == null
          ? null
          : IconText.fromJson(json['subtitleText'] as Map<String, dynamic>),
      primaryText: json['primaryText'] == null
          ? null
          : IconText.fromJson(json['primaryText'] as Map<String, dynamic>),
      secondaryText: json['secondaryText'] == null
          ? null
          : IconText.fromJson(json['secondaryText'] as Map<String, dynamic>),
      badge: json['badge'] as int?,
    );

Map<String, dynamic> _$$_MangaTileToJson(_$_MangaTile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'subtitleText': instance.subtitleText,
      'primaryText': instance.primaryText,
      'secondaryText': instance.secondaryText,
      'badge': instance.badge,
    };
