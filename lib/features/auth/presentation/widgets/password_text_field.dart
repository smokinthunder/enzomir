import 'package:enzomir/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:enzomir/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController textController;
  const PasswordTextField({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: textController, // Replace with your BLoC controller
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
