import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessing {
  initilizefirebasemessage() async {
    print('funtion started');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Received a message in the foreground!');
      if (message.notification != null) {
        debugPrint(
            'Message also contained a notification: ${message.notification}');
        // Handle foreground notifications with your custom logic
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Message clicked!');
      // Handle notification tap when the app is opened from a terminated state
    });
    // Subscribe to topic
    FirebaseMessaging.instance.subscribeToTopic('allUsers');
  }

  gettoken() async {
    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.getToken().then((token) {
      debugPrint("FCM Token: $token");
    });
  }
}
