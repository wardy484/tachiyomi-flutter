import 'package:fluttiyomi/data/tag_section/tag_section.dart' as dto;
import 'package:fluttiyomi/database/tag.dart';
import 'package:isar/isar.dart';

part 'tag_section.g.dart';

@Collection()
class TagSection {
  @Id()
  int? id;

  late String tagSectionId;

  late String label;

  final tags = IsarLinks<Tag>();

  Future<dto.TagSection> toDto() async {
    await tags.load();

    return dto.TagSection(
      id: tagSectionId,
      label: label,
      tags: tags.map((e) => e.toDto()).toList(),
    );
  }
}
