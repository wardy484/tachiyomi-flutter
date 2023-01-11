import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/home/home_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/settings/presentation/installed_source_controller.dart';
import 'package:fluttiyomi/settings/presentation/source_settings_page.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTab extends HookConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(installedSourceStreamProvider).when(
          data: (sources) {
            return sources.isEmpty
                ? const Center(
                    child: Text("No sources installed, click add to add one."),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: sources.length,
                    itemBuilder: (context, index) {
                      final installedSource = sources[index];
                      return SourceTile(
                        source: installedSource,
                        onPressed: () {
                          AutoRouter.of(context).push(
                            BrowseSourceRoute(
                              source: installedSource.source,
                            ),
                          );
                        },
                      );
                    },
                  );
          },
          error: (error, stack) => const Text('Error'),
          loading: (() => const FullPageLoadingIndicator()),
        );
  }
}

class BrowseSourcePage extends ConsumerWidget {
  final Source source;

  const BrowseSourcePage({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(source.name),
      ),
      body: SourceHomeSections(
        source: source,
      ),
    );
  }
}

class SourceHomeSections extends ConsumerWidget {
  final Source source;

  const SourceHomeSections({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(homeSectionsControllerProvider(source)).when(
          loading: () => const FullPageLoadingIndicator(),
          error: (error, stack) => const Text('Error'),
          data: (results) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  var section = results[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          section.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.separated(
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 18),
                          scrollDirection: Axis.horizontal,
                          itemCount: section.items?.length ?? 0,
                          itemBuilder: (context, index) {
                            var manga = section.items![index];

                            return SizedBox(
                              width: 170,
                              child: MangaCard(
                                source: source,
                                mangaId: manga.id,
                                name: manga.title.text,
                                image: manga.image,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            );
          },
        );
  }
}
