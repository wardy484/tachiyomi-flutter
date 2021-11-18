import 'package:auto_route/auto_route.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/manga_dex/search/cubit/search_cubit.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fluttiyomi"),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.when(
                initial: () => const FullPageLoadingIndicator(),
                failed: () => const Text("error"),
                loaded: (results) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.5),
                        ),
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          var item = results.get(index);

                          return GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(
                                ChaptersRoute(
                                  mangaId: item.id,
                                  mangaName: item.title,
                                ),
                              );
                            },
                            child: Stack(children: [
                              Positioned.fill(child: Image.network(item.image)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DecoratedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              item.title,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          );
                        }),
                  );
                });
          },
          bloc: BlocProvider.of<SearchCubit>(context)..getMangaList(),
        ));
  }
}
