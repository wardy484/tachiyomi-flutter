import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/widgets/common/manga_card.dart';

class FavouriteCard extends StatelessWidget {
  final Favourite favourite;

  const FavouriteCard({
    Key? key,
    required this.favourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        MangaCard(
          mangaId: favourite.mangaId,
          name: favourite.name,
          image: favourite.image,
        ),
        if (favourite.unreadChapterCount > 0)
          UnreadChapterTag(favourite: favourite),
      ],
    );
  }
}

class UnreadChapterTag extends StatelessWidget {
  const UnreadChapterTag({
    Key? key,
    required this.favourite,
  }) : super(key: key);

  final Favourite favourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 8,
              ),
              child: Text(favourite.unreadChapterCount.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
