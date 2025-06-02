import 'package:enzomir/presentation/auth/widgets/back_button_widget.dart';
import 'package:enzomir/presentation/auth/widgets/login_button.dart';
import 'package:enzomir/presentation/auth/widgets/login_form.dart';
import 'package:enzomir/presentation/auth/widgets/or_divider.dart';
import 'package:enzomir/presentation/auth/widgets/sign_up_text.dart';
import 'package:enzomir/presentation/auth/widgets/social_buttons.dart';
import 'package:enzomir/presentation/auth/widgets/welcome_text.dart';
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
            children: const [
              SizedBox(height: 0),
              WelcomeText(),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 60),
              LoginButton(),
              SizedBox(height: 40),
              OrDivider(),
              SizedBox(height: 30),
              SocialButtons(),
              SizedBox(height: 10),
              SignUpText(),
            ],
          ),
        ),
      ),
    );
  }
}
