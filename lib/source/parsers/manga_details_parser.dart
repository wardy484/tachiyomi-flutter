import 'package:fluttiyomi/data/source_data.dart';

class MangaDetailsParser {
  static Manga parse(
    Map<String, dynamic> data, {
    required String mangaId,
  }) {
    return Manga.fromJson({
      'langCode': 'en',
      'id': mangaId,
      'altTitles': [],
      'hentai': false,
      ...data,
      'tags': [
        {
          'id': "0",
          'label': 'genres',
          'tags': data['tags'],
        }
      ]
    });
  }
}
