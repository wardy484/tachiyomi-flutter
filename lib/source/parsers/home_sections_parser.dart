import 'package:fluttiyomi/data/home_results/home_section.dart';

class HomeSectionsParser {
  static List<HomeSection> parse(Map<String, dynamic> data) {
    if (data['home_sections'] is Map<String, dynamic>) {
      final homeSections = data['home_sections'] as Map<String, dynamic>;
      final List<HomeSection> sections = [];

      for (var key in homeSections.keys) {
        final section = homeSections[key];
        sections.add(HomeSection.fromJson({
          'id': key,
          'title': section['title'],
          'items': section['items'],
        }));
      }

      return sections;
    }

    if (data['home_sections'] is List) {
      final homeSections = data['home_sections'] as List<dynamic>;
      final List<HomeSection> sections = [];

      for (var section in homeSections) {
        final items = section['items'];

        if (items is! List || items.isEmpty) continue;

        sections.add(HomeSection.fromJson({
          'id': section['id'],
          'title': section['title'],
          'items': section['items'],
        }));
      }

      return sections;
    }

    return [];
  }
}
