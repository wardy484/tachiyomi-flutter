import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChapterListItem extends StatelessWidget {
  final Chapter chapter;
  final Function()? onTap;
  final VoidCallback onLongPress;

  const ChapterListItem({
    Key? key,
    required this.chapter,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeSince = "";

    if (chapter.time is String) {
      DateTime date = DateFormat("E LLL d y H:mm:ss").parse(chapter.time!);
      timeSince = timeago.format(date);
    }

    String subtitle = "Page: ${chapter.page}";

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        textColor: chapter.read ? Colors.grey : Colors.white,
        title: Text(
          chapter.name ?? "Chapter ${chapter.chapterNo}",
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
        trailing: Text(timeSince),
      ),
    );
  }
}
