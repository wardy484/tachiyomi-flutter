import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapterlist.freezed.dart';
part 'chapterlist.g.dart';

@freezed
class ChapterList with _$ChapterList {
  const ChapterList._();

  factory ChapterList(List<Chapter> chapters) = _ChapterList;

  factory ChapterList.fromJson(Map<String, dynamic> json) =>
      _$ChapterListFromJson(json);

  int get length {
    return chapters.length;
  }

  Chapter get(int index) {
    return chapters[index];
  }

  ChapterList ascending() {
    chapters.sort(
      (a, b) => a.chapterNo.compareTo(b.chapterNo),
    );
    return this;
  }

  ChapterList descending() {
    chapters.sort(
      (a, b) => b.chapterNo.compareTo(a.chapterNo),
    );
    return this;
  }

  List<Chapter> toList() {
    return chapters;
  }
}
