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
      height: 280,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
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
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      month,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
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
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.blue,
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
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
