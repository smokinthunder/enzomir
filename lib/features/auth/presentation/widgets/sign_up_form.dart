import 'package:enzomir/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:enzomir/features/auth/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  const SignUpForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          icon: Icons.person,
          hintText: 'Username',
          textController: usernameController,
        ),
        SizedBox(height: 16),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: 'Email',
          textController: emailController,
        ),
        SizedBox(height: 16),
        PasswordTextField(textController: passwordController),
      ],
    );
  }
}
