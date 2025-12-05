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

    WidgetsBinding.instance.addPostFrameCallback((_) => _syncTabs());
  }

  void _syncTabs() {
    final path = GoRouterState.of(context).uri.path;

    if (path.startsWith('/main/home')) _controller.index = 0;
    if (path.startsWith('/main/dashboard')) _controller.index = 1;
    if (path.startsWith('/main/profile')) _controller.index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main",),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          onTap: (i) {
            if (i == 0) context.goNamed(RouteName.home.name);
            if (i == 1) context.goNamed(RouteName.dashboard.name);
            if (i == 2) context.goNamed(RouteName.profile.name);
          },
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}

