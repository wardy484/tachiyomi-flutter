import 'package:async/async.dart';
import 'package:fluttiyomi/data/chapter_list/chapterlist.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_list_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_state.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manga_details_controller.g.dart';

@riverpod
class MangaDetailsController extends _$MangaDetailsController {
  @override
  FutureOr<MangaDetailsState> build(String mangaId) {
    final favourite = ref.watch(favouriteProvider(mangaId)).valueOrNull;

    if (favourite == null) {
      return _getFromSource(mangaId);
    }

    return MangaDetailsState(
      details: favourite.toManga(),
      chapters: ChapterList(favourite.chapters),
      favourite: favourite,
    );
  }

  Future<MangaDetailsState> _getFromSource(String mangaId) async {
    final sourceClient = ref.watch(sourceProvider);

    final futures = FutureGroup();
    futures.add(sourceClient.getMangaDetails(mangaId));
    futures.add(sourceClient.getChapters(mangaId));
    futures.close();

    final futuresResult = await futures.future;

    final details = futuresResult[0];
    final chapters = futuresResult[1];

    return MangaDetailsState(
      details: details,
      chapters: chapters,
      favourite: null,
    );
  }
}
