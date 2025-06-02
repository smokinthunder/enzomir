import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.go(Routes.homePage),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: AppColors.hintTextColor,
            ),
          ),
          const SizedBox(width: 16),
          Text(title, style: AppTextStyles.appBarHeading),
        ],
      ),
    );
  }
}
