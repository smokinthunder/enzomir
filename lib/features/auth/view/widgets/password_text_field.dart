import 'package:enzomir/features/auth/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

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
        icon: Icon(Icons.visibility_outlined, color: context.colors.primary),
      ),
    );
  }
}
