import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourite.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MangaCard extends ConsumerWidget {
  final String mangaId;
  final String name;
  final String image;
  final int newChapterCount;
  final Favourite? favourite;

  const MangaCard({
    Key? key,
    required this.mangaId,
    required this.name,
    required this.image,
    required this.favourite,
    this.newChapterCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () async {
        await AutoRouter.of(context).push(
          ChaptersRoute(
            mangaId: mangaId,
            mangaName: name,
            favourite: favourite,
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: ExtendedNetworkImageProvider(
                  image,
                  cache: true,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: newChapterCount > 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
              if (newChapterCount > 0)
                Padding(
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
                          child: Text(newChapterCount.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 8,
                    bottom: 5,
                  ),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
