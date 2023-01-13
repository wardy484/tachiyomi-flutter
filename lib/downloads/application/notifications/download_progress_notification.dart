import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttiyomi/favourites/applications/check_for_updates_notification.dart';

const int _id = 99;

class DownloadProgressNotification extends ProgressNotification {
  DownloadProgressNotification();

  @override
  Future<void> show(int progress, int maxProgress) async {
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'chapter_downloads',
      'Chapter downloads',
      importance: Importance.none,
      priority: Priority.min,
      onlyAlertOnce: true,
      playSound: false,
      showWhen: false,
      showProgress: true,
      progress: progress,
      maxProgress: maxProgress,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      _id,
      'Downloading chapters ($progress/$maxProgress)',
      null,
      notificationDetails,
    );
  }

  @override
  Future<void> hide() async {
    await flutterLocalNotificationsPlugin.cancel(_id);
  }
}
