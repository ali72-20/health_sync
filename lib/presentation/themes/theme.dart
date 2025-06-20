import 'package:flutter/material.dart';
import 'package:health_sync/presentation/themes/colors.dart';

import 'font_weights.dart';

class Theme {
  ThemeData lightTheme = ThemeData(
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
      onSurface: black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(

    )),
    inputDecorationTheme: InputDecorationTheme(),
    textTheme: TextTheme(
      bodySmall: TextStyle(

      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeights.regular
      ),
      bodyLarge: TextStyle(),
      titleSmall: TextStyle(),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeights.regular
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeights.medium
      ),
      labelSmall: TextStyle(),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeights.medium
      ),
      labelLarge: TextStyle(
        fontSize: 14
      ),
      displaySmall: TextStyle(),
      displayMedium: TextStyle(),
      displayLarge: TextStyle(),
    ),
  );
}
