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
  static const TextStyle getstartedbtn = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    height: 1.0, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: Colors.white,
  );
  static const TextStyle getstartedbtn2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    height: 1.0, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle termStyle1 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    height: 20 / 12, // ≈ 1.67
    letterSpacing: 0.16,
    color: Colors.white,
  );
  static const TextStyle termStyle2 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    height: 20 / 12, // ≈ 1.67
    letterSpacing: 0.16,
    color: AppColors.titleTextColor,
  );

  static const TextStyle getStartedHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 26.0,
    height: 16 / 26, // ≈ 0.62
    letterSpacing: 0.16,
    color: AppColors.titleTextColor,
  );
  static const TextStyle getStartedSubHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
    height: 16 / 13, // ≈ 1.23
    letterSpacing: 0.16,
    color: AppColors.subtitleTextColor,
  );

  static const TextStyle botNavTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400, // 400 is normal
    fontSize: 12.0,
    height: 1.0, // line-height 100% => 1.0 in Flutter
    letterSpacing: 0.0,
  );
}
