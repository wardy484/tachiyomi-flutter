import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/presentation/favourite_updates_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/chapter_options.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_header.dart';
import 'package:fluttiyomi/widgets/chapter_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MangaDetailsPage extends ConsumerStatefulWidget {
  final String id;

  const MangaDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _MangaDetailsPageState createState() => _MangaDetailsPageState();
}

class _MangaDetailsPageState extends ConsumerState<MangaDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ref.watch(mangaDetailsControllerProvider(widget.id)).when(
            data: (mangaDetails) => RefreshIndicator(
              onRefresh: () async {
                if (mangaDetails.favourite != null) {
                  return ref
                      .read(favouriteUpdateQueueControllerProvider.notifier)
                      .addToQueue(mangaDetails.favourite!);
                }
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [MangaDetailsHeader(manga: mangaDetails.details)],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final int itemIndex = index ~/ 2;

                        final chapter =
                            mangaDetails.chapters.chapters[itemIndex];

                        if (index.isEven) {
                          return ChapterListItem(
                              chapter: chapter,
                              onTap: () {
                                // context.router.push(
                                //   ChapterRoute(
                                //     mangaId: widget.id,
                                //     chapterId: chapter.id,
                                //   ),
                                // );
                              },
                              onLongPress: () {
                                if (mangaDetails.favourite != null) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return ChapterOptions(
                                        favourite: mangaDetails.favourite!,
                                        chapter: chapter,
                                      );
                                    },
                                  );
                                }
                              });
                        } else {
                          return const Divider(height: 1);
                        }
                      },
                      childCount: mangaDetails.chapters.length,
                      semanticIndexCallback: (widget, localIndex) {
                        if (localIndex.isEven) {
                          return localIndex ~/ 2;
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
            error: (error, stack) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

// class ChapterListView extends StatelessWidget {
//   final ChapterList chapters;
//   final Favourite favourite;

//   const ChapterListView({
//     Key? key,
//     required this.chapters,
//     required this.favourite,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (_, __) => const Divider(height: 1),
//       itemCount: chapters.length,
//       itemBuilder: (context, index) {
//         final chapter = chapters.get(index - 1);

//         return GestureDetector(
//           onLongPress: () {
//             showDialog<void>(
//               context: context,
//               barrierDismissible: true,
//               builder: (BuildContext context) {
//                 return ChapterOptions(
//                   favourite: favourite,
//                   chapter: chapter,
//                   chapterList: chapters,
//                 );
//               },
//             );
//           },
//           child: ChapterListItem(
//             chapter: chapter,
//             onTap: () async {
//               await AutoRouter.of(context).push(
//                 ReadRoute(
//                   mangaId: favourite.mangaId,
//                   chapter: chapter,
//                   chapters: chapters,
//                   favourite: favourite,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class ChapterListWidget extends ConsumerWidget {
//   final String mangaId;
//   final ChapterList chapters;
//   final Favourite? favourite;

//   const ChapterListWidget({
//     Key? key,
//     required this.mangaId,
//     required this.chapters,
//     required this.favourite,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       separatorBuilder: (context, index) => const Divider(
//         height: 1,
//       ),
//       itemCount: chapters.length + 1,
//       itemBuilder: (context, index) {
//         final chapter = chapters.get(index - 1);

//         return GestureDetector(
//           onLongPress: () {
//             showDialog<void>(
//               context: context,
//               barrierDismissible: true,
//               builder: (BuildContext context) {
//                 return ChapterOptions(
//                   favourite: favourite,
//                   chapter: chapter,
//                   chapterList: chapters,
//                 );
//               },
//             );
//           },
//           child: ChapterListItem(
//             chapter: chapter,
//             onTap: () async {
//               await AutoRouter.of(context).push(
//                 ReadRoute(
//                   mangaId: mangaId,
//                   chapter: chapter,
//                   chapters: chapters,
//                   favourite: favourite,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
