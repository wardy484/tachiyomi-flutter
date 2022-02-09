import 'package:isar/isar.dart';

part 'read_chapter.g.dart';

@Collection()
class ReadChapter {
  @Id()
  int? id;

  late String sourceId;

  @Index(composite: [CompositeIndex('sourceId')])
  late String mangaId;

  late String chapterId;
}
