import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isSignupButton;
  const LoginButton({super.key, this.isSignupButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteButtonTextColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
         isSignupButton ?"Sign Up" :"Login",
          style: AppTextStyles.eventCardTitle.copyWith(
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}
