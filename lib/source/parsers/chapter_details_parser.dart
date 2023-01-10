import 'package:fluttiyomi/data/source_data.dart';

class ChapterDetailsParser {
  static ChapterDetails parse(
    Map<String, dynamic> data, {
    required String mangaId,
    required String chapterId,
  }) {
    return ChapterDetails.fromJson({
      ...data,
      'id': chapterId,
      'mangaId': mangaId,
      'longStrip': false,
    });
  }
}
