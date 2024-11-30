import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => const SplashScreenPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
