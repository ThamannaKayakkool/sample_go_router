import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_go_router/core/service/notification_service.dart';
import 'package:sample_go_router/core/utils/router.dart';
import 'package:sample_go_router/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final NotificationService notificationService = NotificationService();

// function to listen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    notificationService.addMessage(message);
  }
}

// to handle notification on foreground on web platform
void showNotification({required String title, required String body}) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Ok'),
        ),
      ],
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.init();

  // Listen to background notification
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  //to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      notificationService.addMessage(message);

      showNotification(
        title: message.notification!.title!,
        body: message.notification!.body!,
      );
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: notificationService,
      child: MaterialApp.router(
        title: 'Go Router',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
