import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:fluttiyomi/search/search_state.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  // TODO: This is a hack to pass the source schema to the isolate.
  return SearchNotifier(source: ref.read(sourceContainerProvider).get("readm"));
});

class SearchNotifier extends StateNotifier<SearchState> {
  final Source source;

  SearchNotifier({
    required this.source,
  }) : super(const SearchState.initial());

  Future<void> getMangaList(String searchValue) async {
    PagedResults results = await compute(_search, {
      'sourceSchema': source.schema.toJson(),
      'searchValue': searchValue,
    });

    state = SearchState.loaded(results);
  }

  void clearSearch() {
    state = const SearchState.initial();
  }
}

Future<PagedResults> _search(
  Map<String, dynamic> args,
) async {
  final sourceSchema = args['sourceSchema'];
  final searchValue = args['searchValue'] as String;

  final schema = SourceSchema.fromJson(sourceSchema);
  final source = Source.fromSchema(schema);
  return await source.search(searchValue);
}
