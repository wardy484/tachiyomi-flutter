part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loaded(SearchResults results) = _Loaded;
  const factory SearchState.failed() = _Failed;
}
