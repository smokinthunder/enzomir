import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:enzomir/presentation/pages/events/widgets/event_card.dart';
import 'package:enzomir/presentation/pages/events/widgets/event_thumbnail.dart';
import 'package:enzomir/presentation/pages/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Events"),
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
              child: Text('Explore', style: AppTextStyles.exploreHeading),
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
