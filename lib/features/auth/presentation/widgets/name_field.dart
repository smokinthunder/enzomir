import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final String name;

  const NameField({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Icon(Icons.person_outline_sharp, color: AppColors.greyText, size: 35),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name", style: AppTextStyles.inputTextStyle),
              Text(
                name,
                style: AppTextStyles.termStyle1.copyWith(
                  color: AppColors.greyText,
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
