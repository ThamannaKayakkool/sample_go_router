import 'package:go_router/go_router.dart';
import 'package:sample_go_router/feature/presentation/views/dashboard_screen.dart';
import 'package:sample_go_router/feature/presentation/views/error_screen.dart';
import 'package:sample_go_router/feature/presentation/views/home_screen.dart';
import 'package:sample_go_router/feature/presentation/views/profile_screen.dart';

enum RouteName { home,dashboard, profile }

final router = GoRouter(
  errorBuilder:(context, state) => ErrorScreen(),
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RouteName.home.name,
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          name: RouteName.dashboard.name,
          builder: (context, state) {
            final name=state.uri.queryParameters['name'] ?? 'No Name';
            return DashboardScreen(name:name);
          },
        ), GoRoute(
          path: '/profile',
          name: RouteName.profile.name,
          builder: (context, state) {
            return ProfileScreen();
          },
        ),
      ]
    ),
  ],
);
