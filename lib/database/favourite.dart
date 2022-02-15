import 'package:fluttiyomi/data/chapter/chapter.dart' as data_chapter;
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/chapter.dart';
import 'package:isar/isar.dart';

part 'favourite.g.dart';

@Collection()
class Favourite {
  @Id()
  int? id;

  late String sourceId;

  @Index(composite: [CompositeIndex('sourceId')])
  late String mangaId;

  late String name;

  late List<String> titles;

  late String image;

  late double? rating;

  late String? mangaStatus;

  late String? langFlag;

  late String? author;

  late String? artist;

  late List<String>? covers;

  late String? desc;

  late double? follows;

  late DateTime? lastUpdate;

  late bool hasNewChapters;

  final chapters = IsarLinks<Chapter>();

  Manga toManga() {
    return Manga(
      mangaId,
      titles,
      image,
      rating,
      mangaStatus,
      langFlag,
      author,
      artist,
      covers,
      desc,
      follows,
      null, // TODO: include tags
      lastUpdate,
      favourite: true,
    );
  }

  Future<ChapterList> getChapterList() async {
    await chapters.load();
    List<Chapter> oldChapters = chapters.toList();
    // // ..sort((a, b) {
    //   return (a.id ?? 0) > (b.id ?? 0) ? 1 : 0;
    // });

    List<data_chapter.Chapter> newChapters = oldChapters.map((chapter) {
      return data_chapter.Chapter(
        chapter.chapterId,
        chapter.mangaId,
        chapter.chapterNo,
        chapter.langCode,
        chapter.name,
        chapter.volume,
        chapter.group,
        chapter.time,
        read: chapter.read,
      );
    }).toList()
      ..sort((a, b) {
        return double.parse(b.id).compareTo(double.parse(a.id));
      });

    return ChapterList(newChapters);
  }
}

// TODO: Add chapter entity
// TODO: Tag / Tag Section entities
// TODO: Add relationship to chapters has many