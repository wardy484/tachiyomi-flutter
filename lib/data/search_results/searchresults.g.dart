// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchresults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResults _$$_SearchResultsFromJson(Map<String, dynamic> json) =>
    _$_SearchResults(
      (json['results'] as List<dynamic>)
          .map((e) => MangaListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultsToJson(_$_SearchResults instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
