// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Manga _$$_MangaFromJson(Map<String, dynamic> json) => _$_Manga(
      json['id'] as String,
      (json['titles'] as List<dynamic>).map((e) => e as String).toList(),
      json['image'] as String,
      (json['rating'] as num?)?.toDouble(),
      json['mangaStatus'] as String?,
      json['langFlag'] as String?,
      json['author'] as String?,
      json['artist'] as String?,
      (json['covers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['desc'] as String?,
      (json['follows'] as num?)?.toDouble(),
      json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$$_MangaToJson(_$_Manga instance) => <String, dynamic>{
      'id': instance.id,
      'titles': instance.titles,
      'image': instance.image,
      'rating': instance.rating,
      'mangaStatus': instance.mangaStatus,
      'langFlag': instance.langFlag,
      'author': instance.author,
      'artist': instance.artist,
      'covers': instance.covers,
      'desc': instance.desc,
      'follows': instance.follows,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
    };
