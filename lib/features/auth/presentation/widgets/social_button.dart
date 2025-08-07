import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          // Social login logic (handled by BLoC)
        },
        icon: icon,
      ),
    );
  }
}
