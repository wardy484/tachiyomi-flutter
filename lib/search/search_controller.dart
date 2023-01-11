import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/paged_results/paged_results.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<PagedResults> build(Source source) {
    return PagedResults(results: []);
  }

  Future<void> search(String query) async {
    state = const AsyncValue.loading();

    final results = await compute(_search, {
      'sourceSchema': source.schema.toJson(),
      'searchValue': query,
    });

    state = AsyncValue.data(results);
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
