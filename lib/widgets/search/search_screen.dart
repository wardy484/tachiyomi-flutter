import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/search/search_notifier.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';
import 'package:fluttiyomi/widgets/search/search_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchTab extends ConsumerStatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends ConsumerState<SearchTab> {
  @override
  void initState() {
    super.initState();

    ref.read(searchNotifierProvider.notifier).getMangaList("");
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(searchNotifierProvider).when(
          initial: () => const FullPageLoadingIndicator(),
          failed: () => const Text("error"),
          loaded: (results) {
            return Column(
              children: [
                SearchField(
                  onChange: (value) {
                    EasyDebounce.debounce(
                      'search-debouncer',
                      const Duration(milliseconds: 500),
                      () => ref
                          .read(searchNotifierProvider.notifier)
                          .getMangaList(value),
                    );
                  },
                  onClear: () {},
                ),
                Flexible(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                    ),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      var manga = results.get(index);

                      return MangaCard(
                        mangaId: manga.id,
                        name: manga.title,
                        image: manga.image,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
  }
}
