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
      // child: Column(
      //   children: [
      //     Expanded(
      //       child: Image.network(
      //         image,
      //         fit: BoxFit.fitWidth,
      //         alignment: ,
      //       ),
      //     ),
      //     Text(name),
      //   ],
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
