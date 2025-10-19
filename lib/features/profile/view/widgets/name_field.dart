import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class NameField extends StatelessWidget {
  final String name;

  const NameField({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(Icons.person_outline_sharp, color: context.colors.outline, size: 35),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name", style: context.textStyles.bodyLarge),
              Text(
                name,
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
