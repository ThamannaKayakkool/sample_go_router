import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact'), centerTitle: true,leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back),),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(RouteName.dashboard.name);

          },
          child: Text('Dashboard'),
        ),
      ),
    );
  }
}
