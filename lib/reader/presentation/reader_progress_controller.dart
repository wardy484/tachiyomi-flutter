import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reader_progress_controller.g.dart';
part "reader_progress_controller.freezed.dart";

@riverpod
class ReaderUpcomingChaptersController
    extends _$ReaderUpcomingChaptersController {
  @override
  ReaderUpcomingChapters build(Source source, String mangaId, Chapter chapter) {
    final mangaDetails =
        ref.watch(mangaDetailsControllerProvider(source, mangaId)).valueOrNull;

    final prevChapter = mangaDetails?.chapters.getPreviousChapter(chapter);
    final nextChapter = mangaDetails?.chapters.getNextChapter(chapter);

    return ReaderUpcomingChapters(
      previousChapter: prevChapter,
      nextChapter: nextChapter,
    );
  }
}

@freezed
class ReaderUpcomingChapters with _$ReaderUpcomingChapters {
  factory ReaderUpcomingChapters({
    Chapter? nextChapter,
    Chapter? previousChapter,
  }) = _ReaderProgress;

  const ReaderUpcomingChapters._();

  bool get hasNextChapter => nextChapter != null;

  bool get hasPreviousChapter => previousChapter != null;
}
