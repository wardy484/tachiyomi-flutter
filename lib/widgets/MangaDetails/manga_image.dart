import 'package:flutter/material.dart';

class MangaImage extends StatelessWidget {
  final String url;
  const MangaImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
