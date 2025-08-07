import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              'assets/images/onboarding/get_started_top_image.png',
              height: screenHeight * 0.65,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  const Text(
                    "Let's Get Started",
                    style: AppTextStyles.getStartedHeading,
                  ),
                  Gap(10),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Text(
                      "Log in or sign up to organize events and plan better",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.getStartedSubHeading,
                    ),
                  ),
                ],
              ),
              Gap(60),
              Container(
                height: screenHeight / 2,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => context.go(Routes.loginPage) ,
                      child: Container(
                        width: screenWidth * 0.77,
                        height: screenWidth * 0.14,
                        decoration: BoxDecoration(
                          color: AppColors.whiteButtonTextColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Continue with Email',
                            style: AppTextStyles.getstartedbtn,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.white, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white, thickness: 1),
                          ),
                        ],
                      ),
                    ),
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
                          Image.asset("assets/icons/Google.png", height: 28),
                          Gap(10),
                          Text(
                            'Sign in with Google',
                            style: AppTextStyles.getstartedbtn2,
                          ),
                        ],
                      ),
                    ),
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
                          Icon(Icons.smartphone, size: 25),
                          Gap(10),
                          Text(
                            'Continue with Phone Number',
                            style: AppTextStyles.getstartedbtn2,
                          ),
                        ],
                      ),
                    ),
      
                    Column(
                      children: [
                        // Terms and privacy
                        Text(
                          "By signing up or logging in I accept all the",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.termStyle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Terms of Service",
                                style: AppTextStyles.termStyle2,
                              ),
                            ),
                            Text(" and ", style: AppTextStyles.termStyle1),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Privacy Policy",
                                style: AppTextStyles.termStyle2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
