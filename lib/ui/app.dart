import 'package:f_parche/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_parche/config/theme_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase demo',
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.home,
      getPages: appPages,
    );
  }
}
