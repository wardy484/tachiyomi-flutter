// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favourite _$$_FavouriteFromJson(Map<String, dynamic> json) => _$_Favourite(
      id: json['id'] as String,
      userId: json['userId'] as String,
      sourceId: json['sourceId'] as String,
      mangaId: json['mangaId'] as String,
      name: json['name'] as String,
      titles:
          (json['titles'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      mangaStatus: json['mangaStatus'] as String?,
      langFlag: json['langFlag'] as String?,
      author: json['author'] as String?,
      artist: json['artist'] as String?,
      covers:
          (json['covers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      desc: json['desc'] as String?,
      follows: (json['follows'] as num?)?.toDouble(),
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      newChapterIds: (json['newChapterIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastChapterRead: json['lastChapterRead'] == null
          ? null
          : Chapter.fromJson(json['lastChapterRead'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagSections: (json['tagSections'] as List<dynamic>)
          .map((e) => TagSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestChapterNumber: (json['latestChapterNumber'] as num).toDouble(),
      unreadChapterCount: json['unreadChapterCount'] as int?,
    );

Map<String, dynamic> _$$_FavouriteToJson(_$_Favourite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sourceId': instance.sourceId,
      'mangaId': instance.mangaId,
      'name': instance.name,
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
      'newChapterIds': instance.newChapterIds,
      'lastChapterRead': instance.lastChapterRead?.toJson(),
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
      'tagSections': instance.tagSections.map((e) => e.toJson()).toList(),
      'latestChapterNumber': instance.latestChapterNumber,
      'unreadChapterCount': instance.unreadChapterCount,
    };
