import 'package:enzomir/core/theme/colors.dart';
import 'package:flutter/material.dart';

class FilterPop extends StatelessWidget {
  const FilterPop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(48),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        Icons.filter_alt_rounded,
        color: AppColors.primary,
      ),
    );
  }
}
