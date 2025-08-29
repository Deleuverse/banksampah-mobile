import 'package:bank_sampah/app/configs/resources/text_style.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Fors',
    useMaterial3: true,
    primarySwatch: ColorConfig.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    snackBarTheme:
        SnackBarThemeData(contentTextStyle: TextStyleConfig.snackBarStyle),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Fors',
    useMaterial3: true,
    primarySwatch: ColorConfig.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    snackBarTheme:
        SnackBarThemeData(contentTextStyle: TextStyleConfig.snackBarStyle),
    brightness: Brightness.dark,
  );
}
