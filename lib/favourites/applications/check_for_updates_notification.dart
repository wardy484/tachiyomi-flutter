import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const int _id = 22;

class CheckForUpdatesNotification extends ProgressNotification {
  @override
  Future<void> show(int progress, int maxProgress) async {
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'favourites_updates',
      'Favourites Updates',
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

    final message = progress == maxProgress
        ? 'Finished checking for new chapters'
        : 'Checking for new chapters ($progress/$maxProgress)';

    await flutterLocalNotificationsPlugin.show(
      _id,
      message,
      null,
      notificationDetails,
    );
  }

  @override
  Future<void> hide() async {
    await flutterLocalNotificationsPlugin.cancel(_id);
  }
}

abstract class ProgressNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> show(int progress, int maxProgress);
  Future<void> hide();
}
