import 'package:enzomir/presentation/auth/widgets/custom_text_field.dart';
import 'package:enzomir/presentation/auth/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          icon: Icons.person,
          hintText: 'Username',
        ),
        SizedBox(height: 16),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: 'Email',
        ),
        SizedBox(height: 16),
        PasswordTextField(),
      ],
    );
  }
}
