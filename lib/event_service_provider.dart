import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as developer;

// Events
final chapterOpenedEvent = Event<ChapterDetails>("CHAPTER_OPENED");
final chapterReadEvent = Event<ChapterDetails>("CHAPTER_READ");

final eventsProvider = Provider<EventServiceProvider>((ref) {
  return EventServiceProvider(ref);
});

class EventServiceProvider {
  final ProviderRef _ref;

  EventServiceProvider(this._ref);

  registerGlobalEvents() {
    EventRule<ChapterDetails>(chapterOpenedEvent, targets: [
      _ref.read(markChapterAsReadProvider),
      _ref.read(markChapterAsOpenedProvider),
    ]);

    EventRule<ChapterDetails>(chapterReadEvent, targets: [
      _ref.read(markChapterAsReadProvider),
      _ref.read(markChapterAsOpenedProvider),
    ]);
  }
}

// Event handlers
final markChapterAsReadProvider =
    Provider<EventListener<ChapterDetails>>((ref) {
  return EventListener((ChapterDetails chapterDetails) {
    developer.log("Marking chapter as read ${chapterDetails.id}");

    ref.read(readChaptersRepositoryProvider).markAsRead(
          ref.read(sourceClientProvider).sourceId,
          chapterDetails.id,
          chapterDetails.mangaId,
        );
  });
});

final markChapterAsOpenedProvider =
    Provider<EventListener<ChapterDetails>>((ref) {
  return EventListener((ChapterDetails chapterDetails) {
    developer.log("Marking chapter as opened ${chapterDetails.id}");

    ref.read(favouritesProvider.notifier).markAsOpened(
          chapterDetails.mangaId,
          chapterDetails.id,
        );
  });
});
