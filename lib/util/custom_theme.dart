import 'package:flutter/material.dart';

class CustomTheme {
  //TODO:
  static ThemeData theme() {
    return ThemeData(
        textTheme: const TextTheme(
                bodyLarge: TextStyle(),
                bodyMedium: TextStyle(),
                bodySmall: TextStyle(),
                labelLarge: TextStyle(),
                labelMedium: TextStyle(),
                displayLarge: TextStyle(),
                displayMedium: TextStyle(),
                displaySmall: TextStyle(),
                headlineLarge: TextStyle(),
                headlineMedium: TextStyle(),
                headlineSmall: TextStyle())
            .apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ));
  }
}
