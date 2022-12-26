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

  int indexOf(Chapter chapter) {
    return chapters.indexOf(chapter);
  }

  Chapter getByChapterNumber(double chapterNumber) {
    return chapters.firstWhere((chapter) => chapter.chapterNo == chapterNumber);
  }

  Chapter getByChapterId(String chapterId) {
    return chapters.firstWhere((chapter) => chapter.id == chapterId);
  }

  Chapter? getNextChapter(Chapter currentChapter) {
    final acsending = ascending().toList();

    for (int i = 0; i < acsending.length; i++) {
      Chapter chapter = acsending[i];
      if (chapter.chapterNo > currentChapter.chapterNo) {
        return acsending[i];
      }
    }
    return null;
  }

  Chapter? getPreviousChapter(Chapter currentChapter) {
    final acsending = descending().toList();

    for (int i = 0; i < acsending.length; i++) {
      Chapter chapter = acsending[i];

      if (chapter.chapterNo < currentChapter.chapterNo) {
        return acsending[i];
      }
    }
    return null;
  }

  ChapterList ascending() {
    final List<Chapter> newList = List.from(chapters);

    newList.sort(
      (a, b) => a.chapterNo.compareTo(b.chapterNo),
    );

    return copyWith(chapters: newList);
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

  int unreadChapters() {
    int unreadChapterCount = 0;
    for (var chapter in chapters) {
      if (!chapter.read) {
        unreadChapterCount++;
      }
    }
    return unreadChapterCount;
  }

  bool contains(Chapter chapter) {
    return chapters.contains(chapter);
  }

  get isEmpty {
    return chapters.isEmpty;
  }

  ChapterList append(List<Chapter> newChapters) {
    return ChapterList([
      ...newChapters,
      ...chapters,
    ]);
  }
}
