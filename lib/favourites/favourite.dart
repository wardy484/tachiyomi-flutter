import 'package:fluttiyomi/data/source_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite.freezed.dart';
part 'favourite.g.dart';

@freezed
class Favourite with _$Favourite {
  const Favourite._();

  const factory Favourite({
    required String id,
    required String userId,
    required String sourceId,
    required String mangaId,
    required String name,
    required List<String> titles,
    required String image,
    double? rating,
    String? mangaStatus,
    String? langFlag,
    String? author,
    String? artist,
    List<String>? covers,
    String? desc,
    double? follows,
    DateTime? lastUpdate,
    required List<String> newChapterIds,
    Chapter? lastChapterRead,
    required List<Chapter> chapters,
    required List<TagSection> tagSections,
    required double latestChapterNumber,
    int? unreadChapterCount,
  }) = _Favourite;

  factory Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);

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
      tagSections,
      lastUpdate,
      favourite: true,
    );
  }
}
