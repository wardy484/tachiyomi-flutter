import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/search/search_controller.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
import 'package:fluttiyomi/widgets/common/manga_grid.dart';
import 'package:fluttiyomi/search/widgets/search_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends ConsumerWidget {
  final Source source;

  const SearchPage({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${source.name} Search"),
      ),
      body: Column(
        children: [
          SearchField(
            onChange: (value) {
              EasyDebounce.debounce(
                'search-debouncer',
                const Duration(milliseconds: 500),
                () {
                  ref
                      .read(searchControllerProvider(source).notifier)
                      .search(value);
                },
              );
            },
            onClear: () {},
          ),
          ref.watch(searchControllerProvider(source)).when(
                data: (results) {
                  return Flexible(
                    child: MangaGrid(
                      itemCount: results.results.length,
                      itemBuilder: (context, index) {
                        var manga = results.results[index];

                        return MangaCard(
                          source: source,
                          mangaId: manga.id,
                          name: manga.title.text,
                          image: manga.image,
                        );
                      },
                    ),
                  );
                },
                error: ((error, stackTrace) => const Text("error")),
                loading: () => const FullPageLoadingIndicator(),
              ),
        ],
      ),
    );
  }
}
