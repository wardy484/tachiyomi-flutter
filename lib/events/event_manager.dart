// import 'package:event_bus/event_bus.dart';
// import 'package:fluttiyomi/events/event_definitions.dart';
// import 'package:fluttiyomi/events/handlers/event_handler.dart';
// import 'package:fluttiyomi/events/handlers/mark_chapter_as_opened.dart';
// import 'package:fluttiyomi/events/handlers/mark_chapter_as_read.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final eventBusProvider = Provider<EventBus>((_) {
//   return EventBus();
// });

// final eventsProvider = Provider<EventManager>((ref) {
//   return EventManager(
//     ref,
//     ref.read(eventBusProvider),
//   );
// });

// class EventManager {
//   final ProviderRef _ref;
//   final EventBus _eventBus;

//   EventManager(
//     this._ref,
//     this._eventBus,
//   );

//   registerGlobalEvents() {
//     on<ChapterRead>([
//       _ref.read(markChapterAsReadProvider),
//       _ref.read(markChapterAsOpenedProvider),
//     ]);

//     on<ChapterOpened>([
//       _ref.read(markChapterAsReadProvider),
//       _ref.read(markChapterAsOpenedProvider),
//     ]);
//   }

//   void on<T extends Event>(List<EventHandler> handlers) {
//     _eventBus.on<T>().listen((event) {
//       for (var handler in handlers) {
//         handler.handle(event.getPayload());
//       }
//     });
//   }

//   void emit<T>(T event) {
//     _eventBus.fire(event);
//   }
// }
