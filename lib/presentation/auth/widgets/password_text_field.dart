import 'package:enzomir/presentation/auth/widgets/custom_text_field.dart';
import 'package:enzomir/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      icon: Icons.lock_outline,
      hintText: '••••••••••',
      obscureText: true,
      suffixIcon: IconButton(
        onPressed: () {
          // Toggle password visibility logic (handled by BLoC)
        },
        icon: const Icon(Icons.visibility_outlined, color: AppColors.primary),
      ),
    );
  }
}
