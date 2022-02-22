import 'package:freezed_annotation/freezed_annotation.dart';

part 'updated_chapters.freezed.dart';
part 'updated_chapters.g.dart';

@freezed
class UpdatedChapters with _$UpdatedChapters {
  factory UpdatedChapters({
    required List<String> ids,
  }) = _UpdatedChapters;

  factory UpdatedChapters.fromJson(Map<String, dynamic> json) =>
      _$UpdatedChaptersFromJson(json);
}
