import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/widgets/MangaDetails/manga_image.dart';
import 'package:fluttiyomi/widgets/MangaDetails/manga_tags.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends ConsumerStatefulWidget {
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
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: MangaImage(url: widget.manga.image),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.manga.titles[0],
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.manga.author == ""
                          ? "Unknown author"
                          : widget.manga.author ?? "Unknown author",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ref.watch(sourceClientProvider).sourceName,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.onToggleFavourite,
                  label: widget.manga.favourite
                      ? const Text("In library")
                      : const Text("Save to library"),
                  icon: Icon(
                    widget.manga.favourite
                        ? Icons.bookmark
                        : Icons.bookmark_add_outlined,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: widget.onContinuePressed,
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
            widget.manga.desc ?? "...",
            expandText: "Show more",
            collapseText: "Show less",
            maxLines: 2,
          ),
          if (widget.manga.tags != null && widget.manga.tags!.isNotEmpty)
            MangaTags(tagSection: widget.manga.tags!.first),
        ],
      ),
    );
  }
}
