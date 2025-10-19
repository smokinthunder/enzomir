import 'package:enzomir/core/theme/theme.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: context.textStyles.displayMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Login to your account',
          style: context.textStyles.bodyLarge?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
