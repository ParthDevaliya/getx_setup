import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const _primaryHexColor = 0xFF4D69E6;
  static const primaryColor = Color(0xFF4D69E6);
  static const whiteColor = Color(0XFFFFFFFF);
  static const blackColor = Color(0XFF000000);
  static const redColor = Color(0XFFFF0000);
  static const textFieldHeadingColor = Color(0xFF616161);
  static const darkRedColor = Color(0xFFB00020);
  static const lightRedColor = Color(0xFFCF6679);
  static const cyanColor = Color(0xFF03DAC6);
  static const peacockBlueColor = Color(0xFF018786);
  static const indigoColor = Color(0xFF6200EE);
  static const borderColor = Color(0xFFE9E9E9);
  static const darkGreyColor = Color(0XFF808080);
  static const lightBlueColor = Color(0xFFF1F6FF);
  static const lightBlurBorder = Color(0xFFD8E6FF);
  static const card1Color = Color(0XFFccdbe0);
  static const card2Color = Color(0XFFced4e4);
  static const lightPurpleColor = Color(0XFF5869a8);
  static const  card1BelowColor = Color(0XFFdce5ea);
  static const  card2BelowColor = Color(0XFFdde1ea);
  static const  gradientStartAppBarColor = Color(0XFF0092b7);
  static const  gradientEndAppBarColor = Color(0XFF0b708d);

  static List<Color> linearColor = [
    const Color(0xFF4087FC),
    const Color(0xFF136AFF),
  ];

  static List<Color> whitesColor = [
    const Color(0XFFFFFFFF),
    const Color(0XFFFFFFFF),
  ];

  static const MaterialColor primarySwatchColor =
      MaterialColor(_primaryHexColor, {
    50: Color(_primaryHexColor),
    100: Color(_primaryHexColor),
    200: Color(_primaryHexColor),
    300: Color(_primaryHexColor),
    400: Color(_primaryHexColor),
    500: Color(_primaryHexColor),
    600: Color(_primaryHexColor),
    700: Color(_primaryHexColor),
    800: Color(_primaryHexColor),
    900: Color(_primaryHexColor),
  });
}
