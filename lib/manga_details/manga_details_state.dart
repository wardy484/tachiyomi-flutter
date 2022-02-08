import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_details_state.freezed.dart';

@freezed
class MangaDetailsState with _$MangaDetailsState {
  const factory MangaDetailsState.initial() = _Initial;
  const factory MangaDetailsState.loaded(Manga details) = _Loaded;
}
