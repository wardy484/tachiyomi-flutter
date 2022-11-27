import 'package:expandable_text/expandable_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/constants/app_sizes.dart';
import 'package:fluttiyomi/constants/typography.dart';
import 'package:fluttiyomi/data/manga/manga.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_details/presentation/bookmark_button.dart';
import 'package:fluttiyomi/manga_details/presentation/continue_button.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_image.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_tags.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MangaDetailsHeader extends ConsumerWidget {
  final Manga manga;

  const MangaDetailsHeader({
    Key? key,
    required this.manga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        MangaDetailsBackground(manga: manga),
        Column(
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(
                top: Sizes.p8,
                left: Sizes.p16,
                right: Sizes.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MangaBanner(manga: manga),
                  gapH8,
                  Row(
                    children: [
                      BookmarkButton(mangaId: manga.id),
                      gapW16,
                      ContinueButton(mangaId: manga.id)
                    ],
                  ),
                  gapH8,
                  MangaDescription(description: manga.desc),
                  gapH4,
                  if (manga.tags != null && manga.tags!.isNotEmpty)
                    MangaTags(tagSection: manga.tags!.first),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MangaBanner extends ConsumerWidget {
  const MangaBanner({
    Key? key,
    required this.manga,
  }) : super(key: key);

  final Manga manga;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: MangaImage(url: manga.image),
        ),
        gapW16,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                manga.titles[0],
                style: titleStyle,
              ),
              gapH8,
              Text(
                manga.authorName,
                style: mutedTitleStyle,
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
    );
  }
}

class MangaDetailsBackground extends StatelessWidget {
  const MangaDetailsBackground({
    Key? key,
    required this.manga,
  }) : super(key: key);

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(55, 0, 0, 0), Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height - 50));
        },
        blendMode: BlendMode.dstIn,
        child: ExtendedImage.network(
          manga.image,
          cache: true,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MangaDescription extends StatelessWidget {
  final String? description;

  const MangaDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About this manga",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        description == null || description == ""
            ? const Text("No description available")
            : ExpandableText(
                description ?? "...",
                expandText: "Show more",
                collapseText: "Show less",
                maxLines: 2,
              ),
      ],
    );
  }
}
