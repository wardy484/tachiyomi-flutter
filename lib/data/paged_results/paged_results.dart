import 'package:fluttiyomi/data/manga_tile/manga_tile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_results.freezed.dart';
part 'paged_results.g.dart';

@freezed
class PagedResults with _$PagedResults {
  factory PagedResults({
    required List<MangaTile> results,
    Map? meta,
  }) = _PagedResults;

  factory PagedResults.fromJson(Map<String, dynamic> json) =>
      _$PagedResultsFromJson(json);
}
