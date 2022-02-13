// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PagedResults _$$_PagedResultsFromJson(Map<String, dynamic> json) =>
    _$_PagedResults(
      results: (json['results'] as List<dynamic>)
          .map((e) => MangaTile.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_PagedResultsToJson(_$_PagedResults instance) =>
    <String, dynamic>{
      'results': instance.results,
      'meta': instance.meta,
    };
