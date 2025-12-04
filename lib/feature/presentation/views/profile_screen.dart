import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile '),centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: () {
          context.goNamed(RouteName.home.name);

        }, child: Text('Home')),
      ),
    );
  }
}
