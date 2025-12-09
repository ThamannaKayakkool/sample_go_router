import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_go_router/core/service/notification_service.dart';
import 'package:sample_go_router/core/utils/router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationService>().messages;

    return Column(
      children: [
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.goNamed(RouteName.settings.name);
            },
            child: Text('Go to Settings'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Notifications Received: ${notifications.length}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final message = notifications[index];
              return ListTile(
                title: Text(message.notification?.title ?? 'No Title'),
                subtitle: Text(message.notification?.body ?? 'No Body'),
                leading: Icon(Icons.notifications),
              );
            },
          ),
        ),
      ],
    );
  }
}
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Center(
//           child:
//               ElevatedButton(
//                 onPressed: () {
//                   context.goNamed(RouteName.settings.name);
//                 },
//                 child: Text('Settings'),
//               ),
//
//         ),
//       ],
//     );
//   }
// }
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: .center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               // NotificationService().showNotification(title: 'Sample title',body: 'It works');
//             },
//             child: Text('Show Notification'),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               context.goNamed(RouteName.settings.name);
//             },
//             child: Text('Settings'),
//           ),
//         ],
//       ),
//     );
//   }
// }
