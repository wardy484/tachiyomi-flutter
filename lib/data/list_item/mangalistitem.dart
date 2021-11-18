import 'package:freezed_annotation/freezed_annotation.dart';

part 'mangalistitem.freezed.dart';
part 'mangalistitem.g.dart';

@freezed
class MangaListItem with _$MangaListItem {
  factory MangaListItem(
    String id,
    String title,
    String image,
    String iconText,
  ) = _MangaListItem;

  factory MangaListItem.fromJson(Map<String, dynamic> json) =>
      _$MangaListItemFromJson(json);
}