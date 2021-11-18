import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_details.freezed.dart';
part 'chapter_details.g.dart';

@freezed
class ChapterDetails with _$ChapterDetails {
  factory ChapterDetails(
    String id,
    String mangaId,
    List<String> pages,
    bool longStrip,
  ) = _ChapterDetails;

  factory ChapterDetails.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailsFromJson(json);
}
