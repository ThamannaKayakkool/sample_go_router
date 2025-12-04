import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error',),centerTitle: true,),
      body: Center(
        child:  Text('This is Error Screen'),
      ),
    );
  }
}
