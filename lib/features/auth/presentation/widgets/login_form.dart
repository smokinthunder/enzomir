import 'package:enzomir/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:enzomir/features/auth/presentation/widgets/password_text_field.dart';
import 'package:enzomir/features/auth/presentation/widgets/remember_me_and_forgot_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: 'Email',
          textController: emailController,
        ),
        SizedBox(height: 16),
        PasswordTextField(textController: passwordController),
        SizedBox(height: 16),
        RememberMeAndForgotPassword(),
      ],
    );
  }
}
