import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Event image
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/events/event2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Event info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event name
                  const Text(
                    'Stand Up Comedy',
                    style: AppTextStyles.exploreCardTitle,
                  ),

                  const SizedBox(height: 8),

                  // Attendees
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/12.jpg",
                              ),
                            ),
                            Positioned(
                              left: 16,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(
                                  "https://randomuser.me/api/portraits/women/12.jpg",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('+20 Going', style: AppTextStyles.goingText),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.locationTextColor,
                      ),
                      const SizedBox(width: 4),
                      Text('Goa, India', style: AppTextStyles.locationText),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bookmark button
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color:
                  isBookmarked
                      ? AppColors.primary
                      : AppColors.subtitleTextColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
