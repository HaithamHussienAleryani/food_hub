import 'package:flutter/material.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class AppTheme {
  static _border({Color color = AppPallet.borderColor}) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle().copyWith(
          fontFamily: 'Sofia',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displayMedium: const TextStyle().copyWith(
          fontFamily: 'Sofia',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      bodyLarge: const TextStyle().copyWith(
          color: Colors.black,
          fontFamily: 'Sofia',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      bodyMedium: const TextStyle().copyWith(
          fontFamily: 'Sofia',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black),
      // Define other text styles as needed
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallet.backgroundColor,
    ),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(AppPallet.backgroundColor),
      side: BorderSide.none,
    ),
    scaffoldBackgroundColor: AppPallet.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(color: AppPallet.borderColor),
    ),
  );
}
