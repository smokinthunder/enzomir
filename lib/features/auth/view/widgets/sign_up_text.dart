import 'package:enzomir/shared/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';
import 'package:go_router/go_router.dart';

class SignUpText extends StatelessWidget {
  final bool isSignup;
  const SignUpText({super.key, this.isSignup = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " ${isSignup ? "Already" : "Don't"} have an account? ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              isSignup
                  ? context.go(Routes.loginPage)
                  : context.go(Routes.signUpPage);
            },
            child: Text(
              isSignup ? "Login" : 'Sign Up',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
