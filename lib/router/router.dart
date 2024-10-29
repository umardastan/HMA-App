
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/router/app_routes.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/mainpage_screen.dart';

GoRouter router(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.HOME,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: Routes.MAINPAGE,
        builder: (context, state) => const MainpageScreen(),
      ),
    ],
  );
}
