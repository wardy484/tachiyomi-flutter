import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';

class ChapterListItem extends StatelessWidget {
  final Chapter chapter;
  final Function() onTap;

  const ChapterListItem({
    Key? key,
    required this.chapter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        textColor: chapter.read ? Colors.grey : Colors.white,
        title: Text(
          chapter.name ?? "Chapter ${chapter.chapterNo}",
        ),
        subtitle: Text(
          chapter.chapterNo.toString(),
        ),
        // subtitle: Text(item.read.toString()),
      ),
    );
  }
}
