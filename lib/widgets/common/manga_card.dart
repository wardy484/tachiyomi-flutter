import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/router.gr.dart';

class MangaCard extends StatelessWidget {
  final String mangaId;
  final String name;
  final String image;

  const MangaCard({
    Key? key,
    required this.mangaId,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          ChaptersRoute(
            mangaId: mangaId,
            mangaName: name,
          ),
        );
      },
      child: Stack(children: [
        Positioned.fill(child: Image.network(image)),
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
                        name,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
