import 'package:fluttiyomi/data/chapter/chapter.dart' as data_chapter;
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/database/chapter.dart';
import 'package:fluttiyomi/database/tag_section.dart';
import 'package:fluttiyomi/data/tag_section/tag_section.dart'
    as tag_section_dto;

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

  late List<String> newChapterIds;

  final lastChapterRead = IsarLink<Chapter>();

  final chapters = IsarLinks<Chapter>();

  final tagSections = IsarLinks<TagSection>();

  Future<Manga> toManga() async {
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
      await _getTagSectionDto(),
      lastUpdate,
      favourite: true,
    );
  }

  Future<List<tag_section_dto.TagSection>?> _getTagSectionDto() async {
    await tagSections.load();

    if (tagSections.isNotEmpty) {
      final sections = [
        for (final section in tagSections) await section.toDto()
      ];

      return sections;
    }

    return null;
  }

  Future<ChapterList> getChapterList() async {
    await chapters.load();
    List<Chapter> oldChapters = chapters.toList();

    List<data_chapter.Chapter> newChapters = oldChapters.map((chapter) {
      return chapter.convertToChapter();
    }).toList()
      ..sort((a, b) {
        return b.chapterNo.compareTo(a.chapterNo);
      });

    return ChapterList(newChapters);
  }
}

// TODO: Tag / Tag Section entities
