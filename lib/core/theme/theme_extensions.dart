import 'package:flutter/material.dart';

/// Theme extensions for easy access to colors and text styles
extension ThemeExtensions on BuildContext {
  /// Get the color scheme from the current theme
  ColorScheme get colors => Theme.of(this).colorScheme;
  
  /// Get the text theme from the current theme
  TextTheme get textStyles => Theme.of(this).textTheme;
  
  /// Check if the current theme is dark
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  
  /// Get theme-aware colors for custom components
  Color get surfaceColor => colors.surface;
  Color get onSurfaceColor => colors.onSurface;
  Color get primaryColor => colors.primary;
  Color get onPrimaryColor => colors.onPrimary;
  Color get secondaryColor => colors.secondary;
  Color get onSecondaryColor => colors.onSecondary;
  
  /// Get theme-aware text styles
  TextStyle? get displayLarge => textStyles.displayLarge;
  TextStyle? get displayMedium => textStyles.displayMedium;
  TextStyle? get displaySmall => textStyles.displaySmall;
  TextStyle? get headlineLarge => textStyles.headlineLarge;
  TextStyle? get headlineMedium => textStyles.headlineMedium;
  TextStyle? get headlineSmall => textStyles.headlineSmall;
  TextStyle? get titleLarge => textStyles.titleLarge;
  TextStyle? get titleMedium => textStyles.titleMedium;
  TextStyle? get titleSmall => textStyles.titleSmall;
  TextStyle? get bodyLarge => textStyles.bodyLarge;
  TextStyle? get bodyMedium => textStyles.bodyMedium;
  TextStyle? get bodySmall => textStyles.bodySmall;
  TextStyle? get labelLarge => textStyles.labelLarge;
  TextStyle? get labelMedium => textStyles.labelMedium;
  TextStyle? get labelSmall => textStyles.labelSmall;
}
