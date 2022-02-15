import 'package:fluttiyomi/data/paged_results/paged_results.dart';
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
    PagedResults results = await source.search(searchValue);

    state = SearchState.loaded(results);
  }

  void clearSearch() {
    state = const SearchState.initial();
  }
}
