import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: context.colors.primary, width: 2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Stand Up',
          hintStyle: context.textStyles.bodyLarge,
          prefixIcon: Icon(
            Icons.search,
            color: context.colors.onSurfaceVariant,
            size: 20,
          ),
          border:
              InputBorder.none, // Removes the default underline
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          isDense: true, // Reduces extra padding in TextField
        ),
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}