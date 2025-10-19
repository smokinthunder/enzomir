import 'package:enzomir/features/auth/view/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialButton(
          icon: Image.asset("assets/icons/auth/social_media/X.png"), // X icon
          backgroundColor: Colors.black,
        ),
        SocialButton(
          icon: Image.asset(
            "assets/icons/auth/social_media/google.png",
          ), // Google G
          backgroundColor: Colors.white,
        ),
        SocialButton(
          icon: Icon(
            Icons.facebook,
            size: 35,
            color: context.colors.surface,
          ), // Facebook icon
          backgroundColor: Color(0xFF1877F2),
        ),
      ],
    );
  }
}
