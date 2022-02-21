import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/widgets/MangaDetails/header_detail.dart';
import 'package:fluttiyomi/widgets/MangaDetails/manga_image.dart';
import 'package:fluttiyomi/widgets/MangaDetails/manga_tags.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends ConsumerWidget {
  final Manga manga;
  final Function() onToggleFavourite;
  final Function() onContinuePressed;

  const Header({
    Key? key,
    required this.manga,
    required this.onToggleFavourite,
    required this.onContinuePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: MangaImage(url: manga.image),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
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
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onToggleFavourite,
                  label: manga.favourite
                      ? const Text("In library")
                      : const Text("Save to library"),
                  icon: Icon(
                    manga.favourite
                        ? Icons.bookmark
                        : Icons.bookmark_add_outlined,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onContinuePressed,
                  label: const Text("Continue"),
                  icon: const Icon(Icons.play_arrow),
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          const Text(
            "About this manga",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 7),
          ExpandableText(
            manga.desc ?? "...",
            expandText: "Show more",
            collapseText: "Show less",
            maxLines: 2,
          ),
          if (manga.tags != null && manga.tags!.isNotEmpty)
            MangaTags(tagSection: manga.tags!.first),
        ],
      ),
    );
  }
}
