import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/downloads/application/download_service.dart';
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

class MangaDetailsPage extends HookConsumerWidget {
  final String id;
  final String name;
  final Source source;

  const MangaDetailsPage({
    Key? key,
    required this.id,
    required this.name,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = useState(0.0);
    final scrollController = useScrollController();

    useEffect(() {
      // ignore: prefer_function_declarations_over_variables
      final listener = () {
        final newOpacity = 0 + scrollController.offset / 100;
        opacity.value = newOpacity.clamp(0.0, 1.0);
      };

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .appBarTheme
            .backgroundColor!
            .withOpacity(opacity.value),
        elevation: 0,
        title: AnimatedOpacity(
          opacity: opacity.value,
          duration: const Duration(milliseconds: 200),
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        actions:
            ref.watch(mangaDetailsControllerProvider(source, id)).whenOrNull(
                  data: (mangaDetails) => [
                    PopupMenuButton(
                      onSelected: (String value) =>
                          _handleOptionsTapped(ref, value, mangaDetails),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text('Download all'),
                          value: 'download_all',
                        ),
                      ],
                    ),
                    const SizedBox(width: 6)
                  ],
                ),
      ),
      body: ref.watch(mangaDetailsControllerProvider(source, id)).when(
            data: (mangaDetails) => RefreshIndicator(
              onRefresh: () => _onRefresh(ref, mangaDetails),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        MangaDetailsHeader(
                          source: source,
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
                                    source: source,
                                    mangaId: id,
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
                                        source: source,
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

  void _handleOptionsTapped(
    WidgetRef ref,
    String key,
    MangaDetailsState mangaDetails,
  ) {
    switch (key) {
      case 'download_all':
        _downloadAll(ref, mangaDetails);
        break;
    }
  }

  Future<void> _downloadAll(
      WidgetRef ref, MangaDetailsState mangaDetails) async {
    ref.read(downloadServiceProvider).downloadChaptersInBackground(
          source,
          mangaDetails.details,
          mangaDetails.chapters.toList(),
        );
  }
}
