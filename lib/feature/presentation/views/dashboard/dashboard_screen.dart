import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () {
        context.pushNamed(RouteName.contact.name,);
      }, child: Text('Contact')),
    );
  }
}
