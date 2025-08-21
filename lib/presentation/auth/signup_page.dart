import 'package:enzomir/presentation/auth/widgets/back_button_widget.dart';
import 'package:enzomir/presentation/auth/widgets/login_button.dart';
import 'package:enzomir/presentation/auth/widgets/sign_up_form.dart';
import 'package:enzomir/presentation/auth/widgets/sign_up_text.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              Text("Create Account", style: AppTextStyles.loginHeading),
              SizedBox(height: 40),
              SignUpForm(),
              SizedBox(height: 60),
              LoginButton(isSignupButton: true,),
              SizedBox(height: 10),
              SignUpText(isSignup: true,),
            ],
          ),
        ),
      ),
    );
  }
}
