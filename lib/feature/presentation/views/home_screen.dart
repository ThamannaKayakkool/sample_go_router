import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home',),centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: () {
         context.goNamed(RouteName.dashboard.name,queryParameters: {'name':'Thamanna'});
        }, child: Text('Dashboard')),
      ),
    );
  }
}
