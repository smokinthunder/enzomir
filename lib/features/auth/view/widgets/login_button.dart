import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isSignupButton;
  final VoidCallback? onPressed;
  
  const LoginButton({
    super.key, 
    this.isSignupButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        child: Text(
          isSignupButton ? "Sign Up" : "Login",
        ),
      ),
    );
  }
}
