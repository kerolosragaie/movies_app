import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'navigation_service.dart';
import '../widgets/snackbar_message.dart';

class FirebaseNotificationsServices {
  static Future<void> setupFirebaseNotifications() async {
    if (kIsWeb) return;

    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        log('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        log('User granted provisional permission');
      } else {
        log('User declined or has not accepted permission');
      }
    }

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (kDebugMode) {
          log("Notification: ${message.notification?.title ?? ""} received: \n${message.notification?.body ?? ""}");
        }
        SnackbarMessage.showNotificationSnackBar(
          context: NavigationService.navigatorKey.currentContext!,
          title: message.notification?.title ?? "",
          message: message.notification?.body ?? "",
        );
      },
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(message) async {
    await Firebase.initializeApp();
    if (kDebugMode) {
      log('Handling a background message ${message.messageId}');
    }
  }
}
