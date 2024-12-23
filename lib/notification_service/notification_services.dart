// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;

// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();

//   factory NotificationService() => _instance;

//   NotificationService._internal();

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: androidInitializationSettings);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Initialize timezone
//     tz.initializeTimeZones();
//   }

//   Future<void> scheduleDailyNotification({
//     required int id,
//     required String title,
//     required String body,
//     required TimeOfDay timeOfDay,
//   }) async {
//     final now = tz.TZDateTime.now(tz.local);
//     final scheduleTime = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       timeOfDay.hour,
//       timeOfDay.minute,
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduleTime.isBefore(now)
//           ? scheduleTime.add(const Duration(days: 1))
//           : scheduleTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'daily_reminder_channel',
//           'Daily Reminder',
//           channelDescription: 'Reminder to record daily expenses',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   Future<void> scheduleNotification({
//     required int id,
//     required String title,
//     required String body,
//     required DateTime scheduledDateTime,
//   }) async {
//     final tz.TZDateTime tzScheduledDateTime =
//         tz.TZDateTime.from(scheduledDateTime, tz.local);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tzScheduledDateTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'test_notification_channel',
//           'Test Notifications',
//           channelDescription: 'Test notifications for reminders',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:permission_handler/permission_handler.dart'; // Add this import for permission handling

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Request permission for exact alarm
  Future<void> requestExactAlarmPermission() async {
    if (await Permission.scheduleExactAlarm.isGranted) {
      // Permission already granted
      return;
    }

    // Request permission if not granted
    if (await Permission.scheduleExactAlarm.isPermanentlyDenied) {
      // If permission is permanently denied, open settings for the user
      openAppSettings();
    } else {
      // Otherwise, request permission
      await Permission.scheduleExactAlarm.request();
    }
  }

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Initialize timezone
    tz.initializeTimeZones();
  }

  // Schedule notification with a specific time
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDateTime,
  }) async {
    // Ensure exact alarm permission is granted before scheduling
    await requestExactAlarmPermission();

    // Check if the permission was granted
    if (await Permission.scheduleExactAlarm.isGranted) {
      final tz.TZDateTime tzScheduledDateTime =
          tz.TZDateTime.from(scheduledDateTime, tz.local);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzScheduledDateTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'test_notification_channel',
            'Test Notifications',
            channelDescription: 'Test notifications for reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } else {
      print("Permission for exact alarm not granted.");
    }
  }

  // Schedule daily notification at a specific time
  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay timeOfDay,
  }) async {
    // Ensure exact alarm permission is granted before scheduling
    await requestExactAlarmPermission();

    if (await Permission.scheduleExactAlarm.isGranted) {
      final now = tz.TZDateTime.now(tz.local);
      final scheduleTime = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduleTime.isBefore(now)
            ? scheduleTime.add(const Duration(days: 1))
            : scheduleTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_reminder_channel',
            'Daily Reminder',
            channelDescription: 'Reminder to record daily expenses',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } else {
      print("Permission for exact alarm not granted.");
    }
  }

  // Check if the device has battery optimizations enabled and prompt user to disable them
  Future<void> checkBatteryOptimization() async {
    final isIgnoringBatteryOptimizations =
        await Permission.ignoreBatteryOptimizations.isGranted;

    if (!isIgnoringBatteryOptimizations) {
      await Permission.ignoreBatteryOptimizations.request();
    }
  }
}

