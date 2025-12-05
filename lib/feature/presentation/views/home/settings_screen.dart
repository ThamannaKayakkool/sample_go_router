import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting'), centerTitle: true,leading: IconButton(onPressed: () => context.goNamed(RouteName.home.name), icon: Icon(Icons.arrow_back),),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(
              RouteName.info.name,
              queryParameters: {'name': 'Thamanna'},
            );
          },
          child: Text('Info'),
        ),
      ),
    );
  }
}
