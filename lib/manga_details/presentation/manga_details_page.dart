import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_controller.dart';
import 'package:fluttiyomi/manga_details/presentation/chapter_options.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_header.dart';
import 'package:fluttiyomi/manga_details/presentation/chapter_list_item.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_state.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/work_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workmanager/workmanager.dart';

class MangaDetailsPage extends ConsumerStatefulWidget {
  final String id;
  final Source source;

  const MangaDetailsPage({
    Key? key,
    required this.id,
    required this.source,
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
      body: ref
          .watch(mangaDetailsControllerProvider(widget.source, widget.id))
          .when(
            data: (mangaDetails) => RefreshIndicator(
              onRefresh: () => _onRefresh(ref, mangaDetails),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        MangaDetailsHeader(
                          source: widget.source,
                          manga: mangaDetails.details,
                        ),
                      ],
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
                                AutoRouter.of(context).push(
                                  ReaderRoute(
                                    source: widget.source,
                                    mangaId: widget.id,
                                    chapter: chapter,
                                  ),
                                );
                              },
                              onLongPress: () {
                                if (mangaDetails.favourite != null) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return ChapterOptions(
                                        source: widget.source,
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
                      childCount: mangaDetails.chapters.length * 2,
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

  Future<void> _onRefresh(
    WidgetRef ref,
    MangaDetailsState mangaDetails,
  ) async {
    final userId = ref.read(authRepositoryProvider).currentUser.id;
    final favourite = mangaDetails.favourite;

    if (favourite == null) return;

    ref.read(workManagerProvider).registerOneOffTask(
          "$checkFavouriteForUpdatesTask$userId",
          checkFavouriteForUpdatesTask,
          constraints: Constraints(
            networkType: NetworkType.connected,
          ),
          inputData: {
            'favouriteId': favourite.id,
          },
          // ExistingWorkPolicy.keep means that if the task is already running,
          // it will not be restarted and a second will not be started.
          existingWorkPolicy: ExistingWorkPolicy.keep,
        );
  }
}
