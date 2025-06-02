import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpText extends StatelessWidget {
  final bool isSignup;
  const SignUpText({super.key, this.isSignup = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " ${isSignup ? "Already" : "Don't"} have an account? ",
            style: AppTextStyles.termStyle2.copyWith(
              color: AppColors.subtitleTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              isSignup
                  ? context.go(Routes.loginPage)
                  : context.go(Routes.signUpPage);
            },
            child: Text(
              isSignup ? "Login" : 'Sign Up',
              style: AppTextStyles.termStyle2.copyWith(
                color: AppColors.whiteButtonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
