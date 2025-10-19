import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.primary.withAlpha(79),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: context.colors.onSurface, size: 28),
                const SizedBox(width: 8),
                Text(title, style: context.textStyles.bodyLarge),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: context.colors.onSurfaceVariant,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
