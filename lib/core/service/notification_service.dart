import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService extends ChangeNotifier {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  final List<RemoteMessage> _messages = [];

  List<RemoteMessage> get messages => _messages;
  void addMessage(RemoteMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  //request notification permission

  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
      providesAppNotificationSettings: false,
    );
    getToken();
  }

  static Future getToken({int maxRetires = 3}) async {
    try {
      String? token;
      if (kIsWeb) {
        token = await _firebaseMessaging.getToken(
          vapidKey:
              "BOf3AjjpLvKbB9vK7ki9lLf-Z8BJFaPN2YlJ1YwR3OUuXeKI6fO8VZ2MJyTMD6kfqLjLQYUi9qQvPtzEadqO5_w",
        );
        print('device web token: $token');
      } else {
        token = await _firebaseMessaging.getToken();
        print('device token: $token');
      }
      return token;
    } catch (e) {
      print('failed to get device token');

      if (maxRetires > 0) {
        print('try after 10 sec');
        await Future.delayed(Duration(seconds: 10));
        return getToken(maxRetires: maxRetires - 1);
      } else {
        return null;
      }
    }
  }


}
