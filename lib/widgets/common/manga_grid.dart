import 'package:flutter/material.dart';

class MangaGrid extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double heightMultipler;

  const MangaGrid({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.heightMultipler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / heightMultipler),
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
