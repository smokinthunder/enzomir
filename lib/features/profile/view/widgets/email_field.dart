import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class EmailField extends StatelessWidget {
  final String email;

  const EmailField({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(Icons.email, color: context.colors.outline, size: 35),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: context.textStyles.bodyLarge),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.colors.outline,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
