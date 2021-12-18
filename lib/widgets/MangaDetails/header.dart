import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header_detail.dart';
import 'package:fluttiyomi/widgets/MangaDetails/manga_image.dart';

class Header extends StatelessWidget {
  final Manga manga;
  final Function() onToggleFavourite;

  const Header({
    Key? key,
    required this.manga,
    required this.onToggleFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MangaImage(url: manga.image),
              const SizedBox(width: 14),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderDetail(label: "Author", value: manga.author),
                  const SizedBox(height: 24),
                  HeaderDetail(label: "Artist", value: manga.artist),
                  const SizedBox(height: 24),
                  HeaderDetail(label: "Status", value: manga.mangaStatus),
                  const SizedBox(height: 24),
                  const HeaderDetail(label: "Source", value: "Manga Fox"),
                ],
              )
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              IconButton(
                onPressed: onToggleFavourite,
                icon: Icon(
                  manga.favourite
                      ? Icons.bookmark
                      : Icons.bookmark_add_outlined,
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            "About this manga",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 7),
          ExpandableText(
            manga.desc ?? "...",
            expandText: "Show more",
            collapseText: "Show less",
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
