import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiConfig {
  UiConfig._();

  static const String title = 'NeoColetorFacil';

  static ThemeData get themelight => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF023E73),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF023E73),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF023E73),
            systemNavigationBarDividerColor: Color(0xFF023E73),
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF023E73),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFAAB9BF),
          onSecondary: Color(0xFF586F8C),
          error: Color(0xFFB10000),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF444444),
        ),
      );

  static ThemeData get themedark => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF023E73),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF023E73),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF023E73),
            systemNavigationBarDividerColor: Color(0xFF023E73),
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF023E73),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFAAB9BF),
          onSecondary: Color(0xFF586F8C),
          error: Color(0xFFB10000),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFF444444),
          onSurface: Color(0xFFFFFFFF),
        ),
      );
}
