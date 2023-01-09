import 'package:fluttiyomi/data/source_data.dart';

class ChaptersParser {
  static List<Chapter> parse(
    Map<String, dynamic> data, {
    required String mangaId,
  }) {
    assert(data['chapters'] != null);
    assert(data['chapters'] is List<dynamic>);

    final List<Chapter> chapters = [];

    for (int i = 0; i < data['chapters'].length; i++) {
      chapters.add(Chapter.fromJson({
        'langCode': 'en',
        'mangaId': mangaId,
        ...data['chapters'][i],
      }));
    }

    return chapters;
  }
}
