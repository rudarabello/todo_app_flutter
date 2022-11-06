import 'package:flutter/material.dart';
import 'package:todo_app_flutter/design_system/my_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      // ignore: prefer_const_constructors
      colorScheme: const ColorScheme(
        background: MyColor.black,
        brightness: Brightness.dark,
        error: MyColor.error,
        onBackground: MyColor.black,
        onError: MyColor.error,
        onPrimary: MyColor.lightGrey,
        onSurface: MyColor.white,
        onSecondary: MyColor.lightGrey,
        primary: MyColor.primary,
        secondary: MyColor.secondary,
        surface: MyColor.darkGrey,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      // ignore: prefer_const_constructors
      colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: MyColor.primary,
              onPrimary: MyColor.black,
              secondary: MyColor.secondary,
              onSecondary: MyColor.white,
              error: MyColor.error,
              onError: MyColor.black,
              background: MyColor.black,
              onBackground: MyColor.white,
              surface: MyColor.darkGrey,
              onSurface: MyColor.white)
          .copyWith(background: MyColor.black)
          .copyWith(error: MyColor.error),
    );
  }

  static const TextTheme myTheme = TextTheme(
      headlineMedium: TextStyle(
    color: Color(0xFFBAC9D4),
    fontWeight: FontWeight.bold,
  ));
}
