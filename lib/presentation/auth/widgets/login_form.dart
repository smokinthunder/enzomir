import 'package:enzomir/presentation/auth/login_page.dart';
import 'package:enzomir/presentation/auth/widgets/custom_text_field.dart';
import 'package:enzomir/presentation/auth/widgets/password_text_field.dart';
import 'package:enzomir/presentation/auth/widgets/remember_me_and_forgot_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextField(icon: Icons.email_outlined, hintText: 'Email'),
        SizedBox(height: 16),
        PasswordTextField(),
        SizedBox(height: 16),
        RememberMeAndForgotPassword(),
      ],
    );
  }
}
