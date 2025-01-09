// lib/themes/theme.dart

import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryLightColor,
    primaryColorDark: AppColors.primaryDarkColor,
    
    // Background
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    
    // Text Theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textHeadingColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textHeadingColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textHeadingColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondaryColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    
    // Button Theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    
    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.cardBackgroundColor,
      elevation: 4.0,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    
    // Input Decoration Theme (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      hintStyle: TextStyle(
        color: AppColors.textSecondaryColor,
      ),
    ),
    
    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      elevation: 6.0,
    ),
    
    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.textPrimaryColor,
    ),
  );
}
