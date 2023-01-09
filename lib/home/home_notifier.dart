import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/home/home_state.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    source: ref.watch(sourceProvider),
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  Source source;

  HomeNotifier({
    required this.source,
  }) : super(const HomeState.initial());

  Future<void> load() async {
    var sections = await compute(_getHomeSections, source.schema.toJson());

    state = HomeState.loaded(sections);
  }
}

Future<List<HomeSection>> _getHomeSections(
  Map<String, dynamic> sourceSchema,
) async {
  final schema = SourceSchema.fromJson(sourceSchema);
  final source = Source.fromSchema(schema);
  return await source.getHomeSections();
}
