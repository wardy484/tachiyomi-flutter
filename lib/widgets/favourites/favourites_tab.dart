import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:fluttiyomi/manga_dex/favourites/favourites_cubit.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        return state.when(
            initial: () => const FullPageLoadingIndicator(),
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
                      Favourite manga = results[index];

                      return MangaCard(
                        mangaId: manga.mangaId,
                        name: manga.name,
                        image: manga.image,
                      );
                    }),
              );
            });
      },
      bloc: BlocProvider.of<FavouritesCubit>(context)..get(),
    );
  }
}
