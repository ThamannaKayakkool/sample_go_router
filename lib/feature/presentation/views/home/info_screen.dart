import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class InfoScreen extends StatelessWidget {
  final String name;

  const InfoScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info'),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              context.goNamed(RouteName.home.name);

            }, child: Text('Home')),
          ],
        ),
      ),
    );
  }
}
