import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_go_router/feature/presentation/views/dashboard/contact_screen.dart';
import 'package:sample_go_router/feature/presentation/views/dashboard/dashboard_screen.dart';
import 'package:sample_go_router/feature/presentation/views/home/info_screen.dart';
import 'package:sample_go_router/feature/presentation/views/home/settings_screen.dart';

import 'package:sample_go_router/feature/presentation/views/error_screen.dart';
import 'package:sample_go_router/feature/presentation/views/main_screen.dart';
import 'package:sample_go_router/feature/presentation/views/home/home_screen.dart';
import 'package:sample_go_router/feature/presentation/views/profile_screen.dart';

enum RouteName { main, home, dashboard, profile, settings, info, contact }



final router = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(),
  initialLocation: '/main/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/main/home',
          name: RouteName.home.name,
          builder: (context, state) {
            return HomeScreen();
          },
        ),

        GoRoute(
          path: '/main/dashboard',
          name: RouteName.dashboard.name,
          builder: (context, state) {
            return DashboardScreen();
          },
        ),
        GoRoute(
          path: '/main/profile',
          name: RouteName.profile.name,
          builder: (context, state) {
            return ProfileScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      name: RouteName.settings.name,
      builder: (context, state) {
        return SettingScreen();
      },
      routes: [
        GoRoute(
          path: '/info',
          name: RouteName.info.name,
          builder: (context, state) {
            final name = state.uri.queryParameters['name'] ?? 'No Name';
            return InfoScreen(name: name);
          },
        ),
      ],
    ),

    GoRoute(
      path: '/contact',
      name: RouteName.contact.name,
      builder: (context, state) {
        return ContactScreen();
      },
    ),
  ],
);
