import 'package:flutter/material.dart';
import 'package:todo_app_flutter/design_system/my_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: MyColor.black,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: MyColor.white,
    );
  }

  static const TextTheme myTheme = TextTheme(
      headline4: TextStyle(
    color: Color(0xFFBAC9D4),
    fontWeight: FontWeight.bold,
  ));
}
