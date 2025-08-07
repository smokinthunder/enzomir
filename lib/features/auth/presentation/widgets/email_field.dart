import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final String email;

  const EmailField({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Icon(Icons.email, color: AppColors.greyText, size: 35),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: AppTextStyles.inputTextStyle),
              Text(
                email,
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
