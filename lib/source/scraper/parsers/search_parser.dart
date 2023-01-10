import 'package:fluttiyomi/data/source_data.dart';

class SearchResultsParser {
  static PagedResults parse(Map<String, dynamic> data) {
    return PagedResults.fromJson({
      ...data,
    });
  }
}
