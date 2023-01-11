import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeSectionsController extends _$HomeSectionsController {
  @override
  FutureOr<List<HomeSection>> build(Source source) async {
    return await compute(_getHomeSections, source.schema.toJson());
  }
}

Future<List<HomeSection>> _getHomeSections(
  Map<String, dynamic> sourceSchema,
) async {
  final schema = SourceSchema.fromJson(sourceSchema);
  final source = Source.fromSchema(schema);
  return await source.getHomeSections();
}
