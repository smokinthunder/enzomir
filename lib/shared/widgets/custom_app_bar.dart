import 'package:enzomir/core/theme/theme.dart';
import 'package:enzomir/shared/navigation/router.dart';
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
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: context.textStyles.displaySmall,
          ),
        ],
      ),
    );
  }
}
