// part of '/library.dart';

import 'package:flutter/material.dart';
import 'package:login/router/app_routes.dart';
import 'package:login/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  runApp(
      MyApp(initalLocation: prefs.getString('initialLocation') ?? Routes.HOME));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initalLocation});
  final String initalLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Login Bloc Cubit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router(initalLocation),
    );
  }
}
