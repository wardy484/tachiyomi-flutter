import 'package:fluttiyomi/data/icon_text/icon_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_tile.freezed.dart';
part 'manga_tile.g.dart';

@freezed
class MangaTile with _$MangaTile {
  factory MangaTile({
    required String id,
    required IconText title,
    required String image,
    IconText? subtitleText,
    IconText? primaryText,
    IconText? secondaryText,
    int? badge,
  }) = _MangaTile;

  factory MangaTile.fromJson(Map<String, dynamic> json) =>
      _$MangaTileFromJson(json);
}
