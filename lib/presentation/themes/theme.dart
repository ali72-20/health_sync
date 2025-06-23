import 'package:flutter/material.dart';
import 'package:health_sync/presentation/themes/colors.dart';

import 'font_weights.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Roboto",
    scaffoldBackgroundColor: white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: blue,
      onPrimary: white,
      secondary: white,
      onSecondary: black,
      error: red,
      onError: white,
      surface: white,
      onSurface: gray,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 48)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.blue),
      ),
      labelStyle: TextStyle(color: Colors.grey.shade700),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      prefixIconColor: Colors.grey.shade600,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeights.regular),
      bodyLarge: TextStyle(),
      titleSmall: TextStyle(),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeights.regular,color: gray),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeights.medium,color: black),
      labelSmall: TextStyle(),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeights.medium,color: white),
      labelLarge: TextStyle(fontSize: 14),
      displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeights.regular),
      displayMedium: TextStyle(fontSize: 14, fontWeight: FontWeights.regular),
      displayLarge: TextStyle(),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
