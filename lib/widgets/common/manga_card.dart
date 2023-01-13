import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MangaCard extends ConsumerWidget {
  final Source source;
  final String mangaId;
  final String name;
  final String image;
  final int newChapterCount;

  const MangaCard({
    Key? key,
    required this.source,
    required this.mangaId,
    required this.name,
    required this.image,
    this.newChapterCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () async {
        await AutoRouter.of(context).push(
          MangaDetailsRoute(
            source: source,
            name: name,
            id: mangaId,
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
                image: CachedNetworkImageProvider(image),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: newChapterCount > 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
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
