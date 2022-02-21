import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MangaPage extends StatelessWidget {
  final String imagePath;

  const MangaPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imagePath,
      fit: BoxFit.fill,
      cache: true,
    );
  }
}
