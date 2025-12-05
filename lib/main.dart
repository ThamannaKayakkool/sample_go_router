import 'package:flutter/material.dart';
import 'package:sample_go_router/core/utils/router.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Go Router', routerConfig: router,debugShowCheckedModeBanner: false,
    );
  }
}
