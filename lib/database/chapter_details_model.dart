import 'package:fluttiyomi/data/source_data.dart';
import 'package:isar/isar.dart';

part 'chapter_details_model.g.dart';

@Collection()
class ChapterDetailsCache {
  Id? id;

  @Index(composite: [CompositeIndex('mangaId'), CompositeIndex('chapterId')])
  late String sourceId;

  late String chapterId;

  late String mangaId;

  late List<String> pages;

  late bool longStrip;

  @ignore
  ChapterDetails toChapterDetails() {
    return ChapterDetails(
      chapterId,
      mangaId,
      pages,
      longStrip,
    );
  }
}
