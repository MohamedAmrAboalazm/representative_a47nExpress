import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmServices {


  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.instance.subscribeToTopic("all");
    log("Instance 'Notifications Services' has been initialized");
    /// Get any messages which caused the application to open from
    /// a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    /// If the message also contains a data property with a "type" of "chat",
    /// navigate to a chat screen
    if (initialMessage != null) {
      _handleMessageOnMessageOppenApp(initialMessage);
    }

    /// Also handle any interaction when the app is in the background via a
    /// Stream listener
    // background
    FirebaseMessaging.onMessageOpenedApp
        .listen(_handleMessageOnMessageOppenApp);
    //foreground
    FirebaseMessaging.onMessage.listen(_handleMessage);
  }

  void _handleMessageOnMessageOppenApp(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    log("messagecloseapp ${message.notification!.body}");

  }

  void _handleMessage(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    log("notifications ${message.data.length}");
    log("messageopenapp ${message.notification!.body}");
  }

}
