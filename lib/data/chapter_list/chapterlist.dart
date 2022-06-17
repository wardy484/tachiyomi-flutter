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

  Chapter getByChapterNumber(double chapterNumber) {
    return chapters.firstWhere((chapter) => chapter.chapterNo == chapterNumber);
  }

  ChapterList ascending() {
    chapters.sort(
      (a, b) => a.chapterNo.compareTo(b.chapterNo),
    );
    return this;
  }

  ChapterList descending() {
    final List<Chapter> newList = List.from(chapters);
    newList.sort(
      (a, b) => b.chapterNo.compareTo(a.chapterNo),
    );

    return copyWith(chapters: newList);
  }

  List<Chapter> toList() {
    return chapters;
  }
}
