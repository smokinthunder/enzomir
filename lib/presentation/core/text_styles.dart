import 'package:enzomir/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle onboardingHeading = TextStyle(
    fontFamily: 'Jomolhari',
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 30 / 36,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColors.titleTextColor,
  );
  static const TextStyle onboardingText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 30 / 20, // line-height ÷ font-size = 1.5
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColors.whiteTextColor,
  );
  static const TextStyle onboardingButton = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 16 / 14, // line-height ÷ font-size = ~1.14
    letterSpacing: 0.16,
    textBaseline: TextBaseline.alphabetic,
    color: AppColors.whiteButtonTextColor,
  );
}
