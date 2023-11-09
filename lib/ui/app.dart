import 'package:f_parche/ui/middlewares/auth_mw.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/auth/login.dart';
import 'pages/auth/signup.dart';
import 'pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase demo',
      // Made for FlexColorScheme version 7.0.5. Make sure you
// use same or higher package version, but still same major version.
// If you use a lower version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xfffc6411),
          primaryContainer: Color(0xfffeaa68),
          secondary: Color(0xff2979ff),
          secondaryContainer: Color(0xffe4eaff),
          tertiary: Color(0xff2962ff),
          tertiaryContainer: Color(0xffcbd6ff),
          appBarColor: Color(0xffe4eaff),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        appBarStyle: FlexAppBarStyle.primary,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xffffb300),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xff82b1ff),
          secondaryContainer: Color(0xff3770cf),
          tertiary: Color(0xff448aff),
          tertiaryContainer: Color(0xff0b429c),
          appBarColor: Color(0xff3770cf),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        // GetPage(name: '/', page: () => const HomePage()),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/register',
          page: () => SignUpPage(),
        ),
        GetPage(name: '/home', page: () => const HomePage(), middlewares: [
          ProtectedRoute(),
        ]),
        // GetPage(name: '/profile', page: () => const ProfilePage()),
        // GetPage(name: '/settings', page: () => const SettingsPage()),
        // GetPage(name: '/about', page: () => const AboutPage()),
      ],
    );
  }
}
