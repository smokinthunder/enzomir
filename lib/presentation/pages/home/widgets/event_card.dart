import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String month;
  final String title;
  final List<String> attendeeAvatars;
  final int totalAttendees;
  final String location;
  final bool isBookmarked;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.date,
    required this.month,
    required this.title,
    required this.attendeeAvatars,
    required this.totalAttendees,
    required this.location,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.6,
      height: screenWidth * 0.65,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            // Event Image
            Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),

            // Date Badge
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(date, style: AppTextStyles.eventCardDate),
                    Text(month, style: AppTextStyles.eventCardMonth),
                  ],
                ),
              ),
            ),

            // Bookmark Button
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: AppColors.primary,
                  size: 15,
                ),
              ),
            ),

            // Bottom Info Section
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Title
                    Text(
                      title,
                      style: AppTextStyles.eventCardTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),

                    // Attendees Row
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 32,
                          child: Stack(
                            children: [
                              for (
                                int i = 0;
                                i < attendeeAvatars.length && i < 3;
                                i++
                              )
                                Positioned(
                                  left: i * 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundImage: NetworkImage(
                                        attendeeAvatars[i],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        Text(
                          "+$totalAttendees Going",
                          style: AppTextStyles.goingText,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.locationTextColor,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: AppTextStyles.locationText
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
