import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter(
    String id,
    String mangaId,
    @JsonKey(name: 'chapNum') double chapterNo,
    String langCode, // TODO: use enum
    String? name,
    String? volume,
    String? group,
    String? time, {
    @Default(false) bool read,
    @Default(1) int page,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  static List<Chapter> fromJsList(List rawData) {
    List<Chapter> data = [];
    int length = rawData.length;
    for (var i = 0; i < length; i++) {
      data.add(Chapter.fromJson(rawData[i]));
    }

    return data;
  }
}
