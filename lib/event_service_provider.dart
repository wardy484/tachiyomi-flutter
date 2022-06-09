// final markChapterAsOpenedProvider =
//     Provider<EventHandler<ChapterDetails>>((ref) {
//   return (ChapterDetails chapterDetails) {
//     developer.log("Marking chapter as opened ${chapterDetails.id}");

//     ref.read(favouritesProvider.notifier).markAsOpened(
//           chapterDetails.mangaId,
//           chapterDetails.id,
//         );
//   };
// });
