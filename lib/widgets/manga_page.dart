import 'package:flutter/material.dart';

class MangaPage extends StatelessWidget {
  final String imagePath;

  const MangaPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.fill,
    );
  }
}
