import 'package:fluttiyomi/data/list_item/mangalistitem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchresults.freezed.dart';
part 'searchresults.g.dart';

@freezed
class SearchResults with _$SearchResults {
  const SearchResults._();
  factory SearchResults(List<MangaListItem> results) = _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  int get length {
    return results.length;
  }

  MangaListItem get(int index) {
    return results[index];
  }
}
