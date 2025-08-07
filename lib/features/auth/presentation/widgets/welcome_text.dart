import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Welcome Back', style: AppTextStyles.loginHeading),
        SizedBox(height: 8),
        Text('Login to your account', style: AppTextStyles.loginSubHeading),
      ],
    );
  }
}
