import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  // Initialize the screen width

  // Define colors

  const OnboardingScreen({super.key}); // White color for text and button

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Gap(80),
          Text(
            'ENZOMIR',
            style: AppTextStyles.onboardingHeading,
            textAlign: TextAlign.center,
          ),

          Image.asset(
            "assets/images/onboarding/image.png",
            height: screenHeight / 3,
          ),

          // Bottom section with blue background
          Container(
            height: screenHeight / 3,
            width: screenWidth,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Description text
                SizedBox(
                  width: screenWidth * 0.61,
                  child: Text(
                    'Explore Upcoming and Nearby Events',
                    style: AppTextStyles.onboardingText,
                    textAlign: TextAlign.center,
                  ),
                ),

                // Spacer
                // SizedBox(height: 30),
                Container(
                  width: screenWidth * 0.77,
                  height: screenWidth * 0.14,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: AppTextStyles.onboardingButton,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_circle_right_rounded,
                        size: 18,
                        color: AppColors.whiteButtonTextColor,
                      ),
                    ],
                  ),
                ),

                // Get Started button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
