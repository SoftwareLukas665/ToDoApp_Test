import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = ""; //Eigene Schriftart

  //Text mit Namen der App oder des Tabs oben links (appBarTitle)
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  //headline 1
  static const TextStyle headline1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  //headline 2
  static const TextStyle headline2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  //normal text
  static const TextStyle normalText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
}