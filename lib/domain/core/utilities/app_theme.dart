import 'package:flutter/material.dart';
import 'package:timer_test_project/domain/core/utilities/colors.dart';

class AppTheme {
  const AppTheme._();

  static final _lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.redColor2,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.redColor1,
    ),
    brightness: Brightness.light,
    backgroundColor: AppColors.whiteColor1,
    scaffoldBackgroundColor: AppColors.whiteColor1,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    errorColor: AppColors.redColor1,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.redColor2,
      centerTitle: false,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.blackColor1,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headline2: TextStyle(
        color: AppColors.blackColor1,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      headline3: TextStyle(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    ),
  );

  static ThemeData light() {
    return _lightTheme;
  }
}
