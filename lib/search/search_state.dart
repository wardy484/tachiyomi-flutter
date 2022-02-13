import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:fluttiyomi/data/search_results/searchresults.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loaded(PagedResults results) = _Loaded;
  const factory SearchState.failed() = _Failed;
}
