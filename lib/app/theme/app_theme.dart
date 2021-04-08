/// -----------------------------------------------------------------
///
/// File: app_theme.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';

class AppTheme {
  // Primaries
  static Color get primaryBlue => Color(0xFF0088E0);
  static Color get primaryRed => Color(0xFFE24C3B);
  static Color get primaryGreen => Color(0xFF05A357);
  static Color get yellow => Color(0xFFFFC700);

  // Secondaries
  static Color get secondaryBlue => Color(0xFFECF4FD);
  static Color get secondaryRed => Color(0xFFFCEDEB);
  static Color get secondaryGreen => Color(0xFFE6F6EE);

  // Greyscale
  static Color get offBlack => Color(0xFF212121);
  static Color get darkGrey => Color(0xFF9E9E9E);
  static Color get mediumGrey => Color(0xFFDEDCDB);
  static Color get lightGrey => Color(0xFFF5F5F5);
  static Color get offWhite => Color(0xFFFFFDFC);

  static String GILROY = 'Gilroy';
  static String MILLIK = 'Millik';

  // TextStyles
  static TextStyle get headlineOne => TextStyle(
        fontFamily: GILROY,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.35,
        color: Colors.black,
      );

  static TextStyle get headlineTwo => TextStyle(
        fontFamily: MILLIK,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 26,
        height: 1.1,
        color: Colors.black,
      );

  static TextStyle get headlineThree => headlineOne.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1,
      );

  static TextStyle get headlineFour => headlineThree.copyWith(
        fontSize: 16,
        height: 1.45,
      );

  static TextStyle get headlineFive => headlineTwo.copyWith(
        fontSize: 16,
        height: 1.1,
        color: Colors.white,
      );

  static TextStyle get subtitleOne => headlineThree.copyWith(
        fontSize: 18,
        height: 1.35,
      );

  static TextStyle get subtitleTwo => headlineThree.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.45,
      );

  static TextStyle get bodyOne => headlineOne.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.35,
      );

  static TextStyle get bodyTwo => headlineOne.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  ThemeData get themeData => ThemeData(
        primaryColor: offBlack,
        backgroundColor: offWhite,
        scaffoldBackgroundColor: offWhite,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: offBlack,
            onSurface: lightGrey,
            shadowColor: Colors.transparent,
            onPrimary: Colors.white,
            textStyle: bodyOne.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        textTheme: TextTheme(
          headline1: headlineOne,
          headline2: headlineTwo,
          headline3: headlineThree,
          headline4: headlineFour,
          headline5: headlineFive,
          subtitle1: subtitleOne,
          subtitle2: subtitleTwo, // Small
          bodyText1: bodyOne,
          bodyText2: bodyTwo, // Small
        ),
      );
}
