// import 'package:fluttiyomi/chapter_details/read_chapters_repository.dart';
// import 'package:fluttiyomi/data/source_data.dart';
// import 'package:fluttiyomi/events/handlers/event_handler.dart';
// import 'package:fluttiyomi/javascript/source_client.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'dart:developer' as developer;

// final markChapterAsReadProvider = Provider<MarkChapterAsRead>((ref) {
//   return MarkChapterAsRead(
//     ref.read(readChaptersRepositoryProvider),
//     ref.read(sourceClientProvider),
//   );
// });

// class MarkChapterAsRead extends EventHandler<ChapterDetails> {
//   ReadChaptersRepository readChaptersRepository;
//   SourceClient sourceClient;

//   MarkChapterAsRead(
//     this.readChaptersRepository,
//     this.sourceClient,
//   );

//   @override
//   void handle(ChapterDetails payload) {
//     developer.log("Marking chapter as read ${payload.id}");

//     readChaptersRepository.markAsRead(
//       sourceClient.sourceId,
//       payload.id,
//       payload.mangaId,
//     );
//   }
// }
