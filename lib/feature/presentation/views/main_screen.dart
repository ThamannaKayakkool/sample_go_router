import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/core/utils/router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncTabWithRoute();
    });
  }

  void _syncTabWithRoute() {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/main/home')) _controller.index = 0;
    if (location.startsWith('/main/dashboard')) _controller.index = 1;
    if (location.startsWith('/main/profile')) _controller.index = 2;
  }

  @override
  Widget build(BuildContext context) {
   // _syncTabWithRoute();

    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.person)),
          ],
          onTap: (index) {
            if (index == 0) context.goNamed(RouteName.home.name);
            if (index == 1) context.goNamed(RouteName.dashboard.name);
            if (index == 2) context.goNamed(RouteName.profile.name);
          },
        ),
      ),
      body: widget.child,
    );
  }
}
