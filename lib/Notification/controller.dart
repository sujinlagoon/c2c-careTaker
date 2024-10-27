/*

import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Views_/Auth_screen/Sigin_screen/controller/login_controller.dart';
import '../sharedPref/sharedPref.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? fcmToken;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initFirebaseMessaging();
    initLocalNotifications();
  }

  // Initialize Firebase Messaging
  void initFirebaseMessaging() async {
    */
/*fcmToken = await messaging.getToken();
    print('FCM Token: $fcmToken');*/ /*

   // LoginController().getFcmToken();

    var  fcmTokens = await SharedPref().getFCMToken();
    print("after close $fcmTokens");
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message in the foreground: ${message.notification?.body}');

      // Show local notification
      if (message.notification != null) {
        showLocalNotification(
          message.notification?.title,
          message.notification?.body,
        );
      }
    });

    // Handle when the app is opened via the notification (from background or terminated state)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message opened from background: ${message.notification?.body}');
    });
  }

  // Initialize Local Notifications Plugin
  void initLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Show a local notification
  void showLocalNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel_id', // ID for the notification channel
      'channel_name', // Name of the notification channel
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title ?? 'Default Title', // Notification Title
      body ?? 'Default Body', // Notification Body
      platformChannelSpecifics, // Notification Details
    );
  }
}
*/
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initFirebaseMessaging();
    initLocalNotifications();
    setupInteractedMessage();
  }

  // Initialize Firebase Messaging
  void initFirebaseMessaging() async {
    // Request notification permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Received a message in the foreground: ${message.notification?.body}');

      // Show local notification with sound
      if (message.notification != null) {
        showLocalNotification(
          message.notification?.title,
          message.notification?.body,
        );
      }
    });
  }

  // Handle messages when the app is in the background or terminated
  void setupInteractedMessage() async {
    // When the app is in the background and opened by tapping the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          'Notification opened from background: ${message.notification?.body}');
      // Handle notification navigation or actions here
    });

    // When the app is terminated and opened by tapping the notification
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print(
          'Notification opened from terminated state: ${initialMessage.notification?.body}');
      // Handle notification navigation or actions here
    }
  }

  // Initialize Local Notifications Plugin
  void initLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Show a local notification with sound
  void showLocalNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id', // Channel ID from manifest
      'channel_name', // Channel name
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification_sound'), // Custom sound
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title ?? 'Default Title', // Notification Title
      body ?? 'Default Body', // Notification Body
      platformChannelSpecifics, // Notification Details
    );
  }
}
