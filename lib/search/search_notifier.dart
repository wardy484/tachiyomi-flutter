import 'package:fluttiyomi/data/search_results/searchresults.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/search/search_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(source: ref.watch(sourceClientProvider));
});

class SearchNotifier extends StateNotifier<SearchState> {
  final SourceClient source;

  SearchNotifier({
    required this.source,
  }) : super(const SearchState.initial());

  Future<void> getMangaList(String searchValue) async {
    SearchResults results = await source.search(searchValue);

    state = SearchState.loaded(results);
  }

  void clearSearch() {
    state = const SearchState.initial();
  }
}
