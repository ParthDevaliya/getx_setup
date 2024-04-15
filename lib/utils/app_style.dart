import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  AppStyle._();
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.primarySwatchColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white, //thereby
      selectionHandleColor: AppColors.primarySwatchColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.darkGreyColor,
      ),
      displaySmall: TextStyle(
        color: AppColors.darkGreyColor,
      ),
    ),
    cardTheme: const CardTheme(
      shadowColor: AppColors.whiteColor,
      color: AppColors.whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: AppColors.primarySwatchColor,
    inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.whiteColor)),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
  );

  static const blackBold28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const blackBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const blackBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const blackBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const blackBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const blackBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const blackRegular28 = TextStyle(
    fontSize: 28,
  );
  static const blackRegular24 = TextStyle(
    fontSize: 24,
  );
  static const blackRegular20 = TextStyle(
    fontSize: 20,
  );
  static const blackRegular14 = TextStyle(
    fontSize: 14,
  );
  static const blackRegular16 = TextStyle(
    fontSize: 16,
  );
  static const blackRegular18 = TextStyle(
    fontSize: 18,
  );

  static const blackMedium28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static const blackMediumRegular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const blackMedium20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const blackMedium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const blackMedium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const blackMedium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
