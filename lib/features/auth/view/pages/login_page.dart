import 'package:enzomir/features/auth/view/widgets/back_button_widget.dart';
import 'package:enzomir/features/auth/view/widgets/login_button.dart';
import 'package:enzomir/features/auth/view/widgets/login_form.dart';
import 'package:enzomir/features/auth/view/widgets/or_divider.dart';
import 'package:enzomir/features/auth/view/widgets/sign_up_text.dart';
import 'package:enzomir/features/auth/view/widgets/social_buttons.dart';
import 'package:enzomir/features/auth/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/auth/login_appbar2.png"),
              fit: BoxFit.cover,
              ),
            ),
            child: const BackButtonWidget(),
            ),
          const BottomSection(),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 0),
              const WelcomeText(),
              const SizedBox(height: 40),
              const LoginForm(),
              const SizedBox(height: 60),
              const LoginButton(),
              const SizedBox(height: 40),
              const OrDivider(),
              const SizedBox(height: 30),
              const SocialButtons(),
              const SizedBox(height: 10),
              const SignUpText(),
            ],
          ),
        ),
      ),
    );
  }
}