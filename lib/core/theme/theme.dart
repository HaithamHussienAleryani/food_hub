import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class AppTheme {
  static _border({Color color = AppPallet.borderColor}) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.w),
        borderRadius: BorderRadius.circular(10),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle().copyWith(
          fontFamily: 'Nunito',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displayMedium: const TextStyle().copyWith(
          fontFamily: 'Nunito',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      bodyLarge: const TextStyle().copyWith(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      bodyMedium: const TextStyle().copyWith(
          fontFamily: 'Nunito',
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
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppPallet.primary,
    ),
    scaffoldBackgroundColor: AppPallet.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      constraints: BoxConstraints(minHeight: 55.h, maxHeight: 55.h),
      enabledBorder: _border(),
      hintStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppPallet.inputHint),
      focusedBorder: _border(color: AppPallet.primary),
      focusedErrorBorder: _border(),
      errorBorder: _border(),
    ),
  );
}
