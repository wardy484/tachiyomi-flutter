import 'package:fluttiyomi/data/tag_section/tag_section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga.freezed.dart';
part 'manga.g.dart';

@freezed
class Manga with _$Manga {
  factory Manga(
    String id,
    List<String> titles,
    String image,
    double? rating,
    String? mangaStatus,
    String? langFlag,
    String? author,
    String? artist,
    List<String>? covers,
    String? desc,
    double? follows,
    List<TagSection>? tags,
    DateTime? lastUpdate, {
    @Default(false) bool favourite,
  }) = _Manga;

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
}
