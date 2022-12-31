import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttiyomi/database/download.dart';
import 'package:fluttiyomi/favourites/applications/check_for_updates_notification.dart';

const int _id = 99;

class DownloadProgressNotification extends ProgressNotification {
  final Download download;

  DownloadProgressNotification(this.download);

  @override
  Future<void> show(int progress, int maxProgress) async {
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'chapter_downloads',
      'Chapter downloads',
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      showProgress: true,
      progress: progress,
      maxProgress: maxProgress,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      _id,
      'Downloading ${download.mangaName} -  Chapter: ${download.chapterName}',
      null,
      notificationDetails,
    );
  }

  @override
  Future<void> hide() async {
    await flutterLocalNotificationsPlugin.cancel(_id);
  }
}
