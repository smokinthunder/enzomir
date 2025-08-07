import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onpressed;
  const LoginButton({super.key, this.isSignupButton = false, required this.onpressed});
  final bool isSignupButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
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
      ),
    );
  }
}
