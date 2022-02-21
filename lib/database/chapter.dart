import 'package:isar/isar.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart' as data_chapter;

part 'chapter.g.dart';

@Collection()
class Chapter {
  @Id()
  int? id;

  late String sourceId;

  late String mangaId;

  @Index(composite: [CompositeIndex('sourceId'), CompositeIndex('mangaId')])
  late String chapterId;

  late double chapterNo;

  late String langCode;

  late String? name;

  late String? volume;

  late String? group;

  late String? time;

  late bool read;

  late int? page;

  data_chapter.Chapter convertToChapter() {
    return data_chapter.Chapter(
      chapterId,
      mangaId,
      chapterNo,
      langCode,
      name,
      volume,
      group,
      time,
      read: read,
    );
  }
}

// TODO: Add manga details to favourite
// TODO: Add chapter entity
// TODO: Tag / Tag Section entities
// TODO: Add relationship to chapters has many