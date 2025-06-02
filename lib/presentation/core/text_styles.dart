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

  static const TextStyle homeHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    height: 20 / 18, // ≈ 1.11
    letterSpacing: 0.16,
    color: AppColors.whiteTextColor,
  );
  static const TextStyle hintTextSearch = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1, // ≈ 1
    letterSpacing: 0.16,
    color: AppColors.hintTextColor,
  );

  static const TextStyle homeSubheading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700, // 700 corresponds to FontWeight.w700
    fontSize: 20.0,
    height: 16 / 20, // line-height divided by font-size = 0.8
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );

  static const TextStyle recomendedCard = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    height: 18 / 12, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: Colors.white,
  );
  static const TextStyle recomendedCard2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 8.0,
    height: 18 / 6, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: Colors.white,
  );
  static const TextStyle appBarHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 26.0,
    height: 16 / 26, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.primary,
  );
  static const TextStyle exploreHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 22.0,
    height: 16 / 22, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle exploreCardTitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 16 / 16, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle formLabelText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 16 / 16, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.greyText,
  );
  static const TextStyle exploreCardOrganizer = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 16 / 14, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.subtitleTextColor,
  );
  static const TextStyle goingText = TextStyle(
    fontFamily: "Airbnb",
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20 / 12,
    color: AppColors.primary,
  );
  static const TextStyle eventCardTitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    height: 16 / 16, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.pureBlack,
  );

  static const TextStyle eventCardDate = TextStyle(
    fontFamily: 'Airbnb',
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    height: 16 / 16, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.primary,
  );
  static const TextStyle eventCardMonth = TextStyle(
    fontFamily: 'Airbnb',
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 16 / 16, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.primary,
  );
  static const TextStyle locationText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
    height: 1, // ≈ 1
    letterSpacing: 0.16,
    color: AppColors.locationTextColor,
  );
  static const TextStyle searchDetails1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
    height: 16 / 14, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.subtitleTextColor,
  );
  static const TextStyle searchDetails2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 16 / 14, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.primary,
  );
  static const TextStyle inputTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 16 / 15, // line-height 16px / font-size 16px = 1.0
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle profileName = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    height: 1,
    letterSpacing: 0,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle editButtonText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 24 / 14,
    letterSpacing: 0,
    color: AppColors.locationTextColor,
  );
  static const TextStyle loginHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30,
    height: 16 / 30,
    letterSpacing: 0.16,
    color: AppColors.whiteButtonTextColor,
  );
  static const TextStyle loginSubHeading = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 16 / 16,
    letterSpacing: 0.16,
    color: AppColors.subtitleTextColor,
  );
  
}
