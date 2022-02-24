import 'package:fluttiyomi/data/tag/tag.dart' as dto;
import 'package:isar/isar.dart';

part 'tag.g.dart';

@Collection()
class Tag {
  @Id()
  int? id;

  late String tagId;

  late String label;

  dto.Tag toDto() {
    return dto.Tag(
      id: tagId,
      label: label,
    );
  }
}
