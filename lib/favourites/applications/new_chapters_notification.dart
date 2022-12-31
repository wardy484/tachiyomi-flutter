import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';

const int _id = 35;

class NewChaptersNotification extends BaseNotification {
  final Favourite favourite;
  final List<Chapter> chapters;

  NewChaptersNotification(this.favourite, this.chapters);

  Future<void> show() async {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'new_chapters_${favourite.name}',
        'New chapters',
        importance: Importance.max,
        priority: Priority.high,
        onlyAlertOnce: true,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      // Generate a random int as an id and pray they don't clash with other notifications
      Random(_id).nextInt(1000),
      favourite.name,
      "New chapters: ${chapters.map((e) => e.chapterNo).join(', ')}",
      notificationDetails,
    );
  }
}

abstract class BaseNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
}
