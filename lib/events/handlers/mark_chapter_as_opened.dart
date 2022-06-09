import 'package:fluttiyomi/data/source_data.dart';
import 'package:fluttiyomi/events/handlers/event_handler.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as developer;

final markChapterAsOpenedProvider = Provider<MarkChapterAsOpened>((ref) {
  return MarkChapterAsOpened(
    ref.read(favouritesProvider.notifier),
    ref.read(sourceClientProvider),
  );
});

class MarkChapterAsOpened extends EventHandler<ChapterDetails> {
  FavouritesNotifier favouritesNotifier;
  SourceClient sourceClient;

  MarkChapterAsOpened(
    this.favouritesNotifier,
    this.sourceClient,
  );

  @override
  void handle(ChapterDetails payload) {
    developer.log("Marking chapter as opened ${payload.id}");

    favouritesNotifier.markAsOpened(
      payload.id,
      payload.mangaId,
    );
  }
}
