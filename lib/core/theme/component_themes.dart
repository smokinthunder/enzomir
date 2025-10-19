import 'package:flutter/material.dart';
import 'colors.dart';
import 'spacing.dart';

/// Professional component themes for the app
class AppComponentThemes {
  AppComponentThemes._();

  // Elevated Button Theme
  static ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPadding,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          elevation: AppSpacing.elevationSm,
        ),
      );

  // Text Button Theme
  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPadding,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
        ),
      );

  // Outlined Button Theme
  static OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPadding,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
        ),
      );

  // Input Decoration Theme
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(AppSpacing.inputPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      );

  // Card Theme
  static CardThemeData get cardTheme => CardThemeData(
        elevation: AppSpacing.elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        margin: const EdgeInsets.all(AppSpacing.sm),
      );

  // App Bar Theme
  static AppBarTheme get appBarTheme => const AppBarTheme(
        elevation: AppSpacing.elevationNone,
        centerTitle: true,
        toolbarHeight: AppSpacing.appBarHeight,
      );

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: AppSpacing.elevationMd,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.grey500,
      );

  // Dialog Theme
  static DialogThemeData get dialogTheme => DialogThemeData(
        elevation: AppSpacing.elevationLg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        ),
        insetPadding: const EdgeInsets.all(AppSpacing.lg),
      );

  // Divider Theme
  static const DividerThemeData dividerTheme = DividerThemeData(
        thickness: 1,
        color: AppColors.grey300,
        space: AppSpacing.sm,
      );

  // Icon Theme
  static const IconThemeData iconTheme = IconThemeData(
        size: AppSpacing.iconMd,
        color: AppColors.grey600,
      );

  // List Tile Theme
  static ListTileThemeData get listTileTheme => const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        minVerticalPadding: AppSpacing.xs,
      );
}
