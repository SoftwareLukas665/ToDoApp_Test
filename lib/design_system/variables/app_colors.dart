import 'package:flutter/material.dart';

class AppColors {
  bool darkMode = false;

  static const Color appBackground = Color(0xFFF1F1F3); // Background color for the entire app

  static const Color elementBackgroundLight = Color(0xbde9e9eb); // Background with light tint color for elements like buttons, cards, etc.
  static const Color elementBackgroundMiddle = Color(0xFFe4e4e6); // Background with middle (between dark and light) tint color for elements like buttons, cards, etc.
  static const Color elementBackgroundDark = Color(0xFF222222); // Background with dark tint color for elements like buttons, cards, etc.


  static const Color textPrimary = Color(0xFF3F3F3F); // Primary text color for the app
  static const Color textSecondary = Color(0xFF757575); // Secondary text color for the app



  // // template for new colors, just append the hex-code of the color to the end of the line (after '0xFF')
  // static const Color template = Color(0xFF);



  // static const Color textPrimary = Color(0xFF3F3F3F); // Primary text color for the app
  // static const Color textSecondary = Color(0xFF757575); // Secondary text color for the app

  static const int backgroundValue = 0xFFF5F5F5; // Background color value for the entire app


/* Old AppColors
  static const Color backgroundLight = Color(0xFFF5F5F5); // Background color for the entire app
  static const Color accentDark = Color(0xFFBA9A73); // Accent color for buttons, icons, etc.
  static const Color accentLight = Color(0xFFF5ECDC); // Accent color for elements like buttons, cards, etc.
  static const Color text = Color(0xFF3F3F3F); // Primary text color for the app

  static const int backgroundLightValue = 0xFFF5F5F5; // Background color value for the entire app
  //static const int backgroundValue = 0xFF2B2B2B; //The background color of the app
*/
}