import 'package:flutter/material.dart';

/// Professional color system for the app
class AppColors {
  AppColors._();

  // Brand Primary Colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryBlueDark = Color(0xFF1976D2);
  static const Color primaryBlueLight = Color(0xFF42A5F5);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Light Theme Color Scheme
  static ColorScheme get lightColorScheme => ColorScheme.light(
        primary: primaryBlue,
        onPrimary: white,
        surface: white,
        onSurface: grey900,
      );

  // Dark Theme Color Scheme  
  static ColorScheme get darkColorScheme => ColorScheme.dark(
        primary: primaryBlueLight,
        onPrimary: grey900,
        surface: grey900,
        onSurface: white,
      );
}
