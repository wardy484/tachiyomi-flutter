import 'package:isar/isar.dart';

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
}

// TODO: Add manga details to favourite
// TODO: Add chapter entity
// TODO: Tag / Tag Section entities
// TODO: Add relationship to chapters has many