import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MangaImage extends StatelessWidget {
  final String url;
  const MangaImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
      ),
    );
  }
}
