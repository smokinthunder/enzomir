import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String organizer;
  final bool isLiked;
  final bool isBookmarked;

  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.organizer,
    required this.isLiked,
    required this.isBookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Event image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.textStyles.titleSmall),
                    const SizedBox(height: 4),
                    Text(organizer, style: context.textStyles.bodySmall),
                  ],
                ),

                // Action buttons
                Row(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color:
                          isLiked
                              ? context.colors.primary
                              : context.colors.onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color:
                          isBookmarked
                              ? context.colors.primary
                              : context.colors.onSurfaceVariant,
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
