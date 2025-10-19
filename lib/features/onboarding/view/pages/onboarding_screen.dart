import 'package:enzomir/shared/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  // Initialize the screen width

  // Define colors

  const OnboardingScreen({super.key}); // White color for text and button

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap(80),
          Text(
            'ENZOMIR',
            style: context.textStyles.displayLarge,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "assets/images/onboarding/image.png",
            height: screenHeight / 3,
          ),
          Container(
            height: screenHeight / 3,
            width: screenWidth,
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth * 0.61,
                  child: Text(
                    'Explore Upcoming and Nearby Events',
                    style: context.textStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () => context.go(Routes.getStartedPage),
                  child: Container(
                    width: screenWidth * 0.77,
                    height: screenWidth * 0.14,
                    decoration: BoxDecoration(
                      color: context.colors.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: context.textStyles.labelLarge,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 20,
                          color: context.colors.onSurface,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
