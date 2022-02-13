import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_text.freezed.dart';
part 'icon_text.g.dart';

@freezed
class IconText with _$IconText {
  factory IconText({
    required String text,
    String? icon,
  }) = _IconText;

  factory IconText.fromJson(Map<String, dynamic> json) =>
      _$IconTextFromJson(json);
}
