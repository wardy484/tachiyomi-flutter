import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/manga_dex/chapters/chapter_cubit.dart';
import 'package:fluttiyomi/manga_dex/manga_details/manga_details_cubit.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';

class ChaptersPage extends StatefulWidget {
  final String mangaId;
  final String mangaName;

  ChaptersPage({Key? key, required this.mangaId, required this.mangaName})
      : super(key: key);

  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mangaName),
      ),
      body: BlocBuilder<MangaDetailsCubit, MangaDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const FullPageLoadingIndicator(),
            loaded: (manga) {
              return BlocBuilder<ChapterCubit, ChapterState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const FullPageLoadingIndicator(),
                    loaded: (results) {
                      return ListView.builder(
                        itemCount: results.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Header(manga: manga);
                          }

                          if (index == 1) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Respond to button press
                                },
                                label: const Text("Continue Reading"),
                                icon: const Icon(Icons.play_arrow, size: 18),
                              ),
                            );
                          }

                          var item = results.get(index - 2);

                          return GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(
                                ReadRoute(
                                    mangaId: widget.mangaId,
                                    chapter: item,
                                    chapters: results,
                                    currentChapter: index - 2),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                  item.name ?? "Chapter ${item.chapterNo}"),
                              subtitle: Text(item.chapterNo.toString()),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                bloc: BlocProvider.of<ChapterCubit>(context)
                  ..getChapters(widget.mangaId),
              );
            },
          );
        },
        bloc: BlocProvider.of<MangaDetailsCubit>(context)
          ..getMangaDetails(widget.mangaId),
      ),
    );
  }
}
