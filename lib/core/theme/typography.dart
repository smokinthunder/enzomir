import 'package:flutter/material.dart';

/// Professional typography system for the app
class AppTypography {
  AppTypography._();

  // Font families
  static const String primaryFontFamily = 'Poppins';
  static const String secondaryFontFamily = 'Inter';

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Text Theme for Light mode
  static TextTheme get lightTextTheme => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 32,
          fontWeight: bold,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 28,
          fontWeight: bold,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 24,
          fontWeight: semiBold,
          letterSpacing: -0.25,
        ),
        headlineLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 22,
          fontWeight: semiBold,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 20,
          fontWeight: medium,
          letterSpacing: 0.15,
        ),
        headlineSmall: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 18,
          fontWeight: medium,
          letterSpacing: 0.15,
        ),
        titleLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: medium,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 14,
          fontWeight: medium,
          letterSpacing: 0.1,
        ),
        titleSmall: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 12,
          fontWeight: medium,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 16,
          fontWeight: regular,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 14,
          fontWeight: regular,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 12,
          fontWeight: regular,
          letterSpacing: 0.4,
        ),
        labelLarge: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 14,
          fontWeight: medium,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 12,
          fontWeight: medium,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontFamily: secondaryFontFamily,
          fontSize: 10,
          fontWeight: medium,
          letterSpacing: 0.5,
        ),
      );

  // Text Theme for Dark mode (same as light but will inherit colors from theme)
  static TextTheme get darkTextTheme => lightTextTheme;
}
