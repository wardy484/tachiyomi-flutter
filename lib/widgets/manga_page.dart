import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';

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
