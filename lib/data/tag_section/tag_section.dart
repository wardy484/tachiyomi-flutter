import 'package:fluttiyomi/data/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_section.freezed.dart';
part 'tag_section.g.dart';

@freezed
class TagSection with _$TagSection {
  factory TagSection({
    required String id,
    required String label,
    required List<Tag> tags,
  }) = _TagSection;

  factory TagSection.fromJson(Map<String, dynamic> json) =>
      _$TagSectionFromJson(json);
}
