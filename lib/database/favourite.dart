import 'package:isar/isar.dart';

part 'favourite.g.dart';

@Collection()
class Favourite {
  @Id()
  int? id;

  late String sourceId;

  @Index(composite: [CompositeIndex('sourceId')])
  late String mangaId;

  late String name;

  late String image;

  late bool hasNewChapters;
}
