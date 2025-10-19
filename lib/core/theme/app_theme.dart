import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'component_themes.dart';

/// Professional theme system for the app
/// Combines all theme modules into cohesive light and dark themes
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: AppColors.lightColorScheme,
        textTheme: AppTypography.lightTextTheme,
        
        // Component themes
        elevatedButtonTheme: AppComponentThemes.elevatedButtonTheme,
        textButtonTheme: AppComponentThemes.textButtonTheme,
        outlinedButtonTheme: AppComponentThemes.outlinedButtonTheme,
        inputDecorationTheme: AppComponentThemes.inputDecorationTheme,
        cardTheme: AppComponentThemes.cardTheme,
        appBarTheme: AppComponentThemes.appBarTheme,
        bottomNavigationBarTheme: AppComponentThemes.bottomNavigationBarTheme,
        dialogTheme: AppComponentThemes.dialogTheme,
        dividerTheme: AppComponentThemes.dividerTheme,
        iconTheme: AppComponentThemes.iconTheme,
        listTileTheme: AppComponentThemes.listTileTheme,
      );

  /// Dark theme configuration
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: AppColors.darkColorScheme,
        textTheme: AppTypography.darkTextTheme,
        
        // Component themes (reused for consistency)
        elevatedButtonTheme: AppComponentThemes.elevatedButtonTheme,
        textButtonTheme: AppComponentThemes.textButtonTheme,
        outlinedButtonTheme: AppComponentThemes.outlinedButtonTheme,
        inputDecorationTheme: AppComponentThemes.inputDecorationTheme,
        cardTheme: AppComponentThemes.cardTheme,
        appBarTheme: AppComponentThemes.appBarTheme,
        bottomNavigationBarTheme: AppComponentThemes.bottomNavigationBarTheme,
        dialogTheme: AppComponentThemes.dialogTheme,
        dividerTheme: AppComponentThemes.dividerTheme,
        iconTheme: AppComponentThemes.iconTheme,
        listTileTheme: AppComponentThemes.listTileTheme,
      );
}
