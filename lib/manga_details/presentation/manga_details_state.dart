import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_details_state.freezed.dart';

@freezed
class MangaDetailsState with _$MangaDetailsState {
  factory MangaDetailsState({
    required Manga details,
    required ChapterList chapters,
    required Favourite? favourite,
  }) = _MangaDetailsState;
}
