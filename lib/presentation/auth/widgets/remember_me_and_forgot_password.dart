import 'package:enzomir/presentation/auth/login_page.dart';
import 'package:enzomir/presentation/auth/widgets/custom_checkbox.dart';
import 'package:enzomir/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: const [
            CustomCheckbox(),
            SizedBox(width: 8),
            Text(
              'Remember Me',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                height: 16 / 12,
                letterSpacing: 0.16,
                textBaseline:
                    TextBaseline
                        .alphabetic, // closest to CSS vertical-align: middle
                color: AppColors.subtitleTextColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // Forgot password logic (handled by BLoC)
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              height: 16 / 12,
              letterSpacing: 0.16,
              textBaseline:
                  TextBaseline
                      .alphabetic, // closest to CSS vertical-align: middle
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
