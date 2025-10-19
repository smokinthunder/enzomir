import 'package:enzomir/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: context.textStyles.bodyLarge,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon, 
          color: context.colors.primary,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
