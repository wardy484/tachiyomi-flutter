part of 'manga_details_cubit.dart';

@freezed
class MangaDetailsState with _$MangaDetailsState {
  const factory MangaDetailsState.initial() = _Initial;
  const factory MangaDetailsState.loaded(Manga details) = _Loaded;
}
