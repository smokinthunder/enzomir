import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: AppColors.hintTextColor,
                  ),
                  const SizedBox(width: 16),
                  Text('Events', style: AppTextStyles.AppBarHeading),
                ],
              ),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                children: const [
                  EventThumbnail(image: 'assets/images/events/event1.png'),
                  EventThumbnail(image: 'assets/images/events/event1.png'),
                  EventThumbnail(image: 'assets/images/events/event1.png'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Text('Explore', style: AppTextStyles.ExploreHeading),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: const [
                  EventCard(
                    image: 'assets/images/events/event2.png',
                    title: 'Stand Up Comedy',
                    organizer: 'Alex Doe  ',
                    isLiked: true,
                    isBookmarked: true,
                  ),
                  SizedBox(height: 16),
                  EventCard(
                    image: 'assets/images/events/event2.png',
                    title: 'Wedding',
                    organizer: 'Alex Doe',
                    isLiked: false,
                    isBookmarked: true,
                  ),
                  SizedBox(height: 16),
                  EventCard(
                    image: 'assets/images/events/event2.png',
                    title: 'Wedding',
                    organizer: 'Alex Doe',
                    isLiked: false,
                    isBookmarked: true,
                  ),
                  SizedBox(height: 16),
                  EventCard(
                    image: 'assets/images/events/event2.png',
                    title: 'Wedding',
                    organizer: 'Alex Doe',
                    isLiked: false,
                    isBookmarked: true,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventThumbnail extends StatelessWidget {
  final String image;

  const EventThumbnail({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      height: 175,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String organizer;
  final bool isLiked;
  final bool isBookmarked;

  const EventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.organizer,
    required this.isLiked,
    required this.isBookmarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                    Text(
                      title,
                      style: AppTextStyles.ExploreCardTitle
                    ),
                    const SizedBox(height: 4),
                    Text(
                      organizer,
                      style: AppTextStyles.ExploreCardOrganizer
                    ),
                  ],
                ),

                // Action buttons
                Row(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.blue : Colors.grey,
                      size: 22,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.blue : Colors.grey,
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
