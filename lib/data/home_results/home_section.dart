import 'package:fluttiyomi/data/manga_tile/manga_tile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_section.freezed.dart';
part 'home_section.g.dart';

@freezed
class HomeSection with _$HomeSection {
  factory HomeSection({
    required String id,
    required String title,
    String? type,
    List<MangaTile>? items,
    @JsonKey(name: 'view_more') bool? viewMore,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionFromJson(json);
}
