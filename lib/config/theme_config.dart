import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class ThemeConfig {
  static final lightTheme = FlexThemeData.light(
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
  );

  static final darkTheme = FlexThemeData.dark(
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
  );
}
