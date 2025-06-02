import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';

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
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Stand Up',
          hintStyle: AppTextStyles.hintTextSearch,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.hintTextColor,
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
