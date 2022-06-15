import 'package:film_fan/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  fontFamily: 'NotoSans',
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: kPrimaryColor,
    secondary: kBlackColor,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 25, fontWeight: FontWeight.w600, color: kBlackColor),
    headline2: TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: kBlackColor,
    ),
    headline4: TextStyle(
      fontFamily: 'NotoSansRegular',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: kGreyColor,
    ),
  ),
);
