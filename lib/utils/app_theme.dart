import 'package:flutter/material.dart';
import 'package:newsity/constants/color_constants.dart';

class Themes {
  static final appTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    primaryColor: AppColors.deepPurple,
    scaffoldBackgroundColor: AppColors.lightGrey,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.deepPurple),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.deepPurple),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.deepPurple),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => AppColors.deepPurple,
      ),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => AppColors.deepPurple,
        ),
      ),
    ),
  );
}
