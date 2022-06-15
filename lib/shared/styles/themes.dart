import 'package:film_fan/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  fontFamily: 'NotoSans',
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: kPrimaryColor,
    secondary: kRedColor,
  ),
  textTheme: const TextTheme(
    headline1:
        TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: kRedColor),
    headline2: TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: kRedColor,
    ),
    headline4: TextStyle(
      fontFamily: 'NotoSansRegular',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: kGreyColor,
    ),
  ),
);
