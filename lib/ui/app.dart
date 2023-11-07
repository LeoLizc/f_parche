import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/auth/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        // GetPage(name: '/', page: () => const HomePage()),
        // GetPage(name: '/login', page: () => const LoginPage()),
        // GetPage(name: '/register', page: () => const RegisterPage()),
        // GetPage(name: '/home', page: () => const HomePage()),
        // GetPage(name: '/profile', page: () => const ProfilePage()),
        // GetPage(name: '/settings', page: () => const SettingsPage()),
        // GetPage(name: '/about', page: () => const AboutPage()),
      ],
    );
  }
}
