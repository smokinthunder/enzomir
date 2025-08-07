import 'package:enzomir/core/theme/text_styles.dart';
import 'package:enzomir/presentation/pages/home/widgets/event_card.dart';
import 'package:enzomir/presentation/pages/home/widgets/home_filter_icons.dart';
import 'package:enzomir/presentation/pages/home/widgets/recommended_card.dart';
import 'package:enzomir/presentation/pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

    const List<Map<String, dynamic>> homeFilterIconMap = [
      {"text": "Sports", "icon": Icons.sports_basketball_rounded},
      {"text": "Music", "icon": Icons.music_note_rounded},
      {"text": "Food", "icon": Icons.fastfood_rounded},
      {"text": "Art", "icon": Icons.color_lens_rounded},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.black,
            ),
            child: Image.asset(
              "assets/images/home/app_bar.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Gap(screenHeight * 0.075),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text(
                    "Discover amazing events \n near by you",
                    style: AppTextStyles.homeHeading,
                  ),
                ),
                CustomSearchBar(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      homeFilterIconMap.length,
                      (index) => HomeFilterIcon(
                        text: homeFilterIconMap[index]["text"],
                        icon: homeFilterIconMap[index]["icon"],
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "Upcoming Events",
                    style: AppTextStyles.homeSubheading,
                    textAlign: TextAlign.left,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EventCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                        date: '10',
                        month: 'JUNE',
                        title: 'DJ Night club vista mar...',
                        attendeeAvatars: [
                          'https://randomuser.me/api/portraits/women/12.jpg',
                          'https://randomuser.me/api/portraits/women/24.jpg',
                          'https://randomuser.me/api/portraits/men/32.jpg',
                        ],
                        totalAttendees: 20,
                        location: 'Kochi, Kerala',
                        isBookmarked: true,
                      ),
                      EventCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                        date: '10',
                        month: 'JUNE',
                        title: 'DJ Night club vista mar...',
                        attendeeAvatars: [
                          'https://randomuser.me/api/portraits/women/12.jpg',
                          'https://randomuser.me/api/portraits/women/24.jpg',
                          'https://randomuser.me/api/portraits/men/32.jpg',
                        ],
                        totalAttendees: 20,
                        location: 'Kochi, Kerala',
                        isBookmarked: true,
                      ),
                      EventCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                        date: '10',
                        month: 'JUNE',
                        title: 'DJ Night club vista mar...',
                        attendeeAvatars: [
                          'https://randomuser.me/api/portraits/women/12.jpg',
                          'https://randomuser.me/api/portraits/women/24.jpg',
                          'https://randomuser.me/api/portraits/men/32.jpg',
                        ],
                        totalAttendees: 20,
                        location: 'Kochi, Kerala',
                        isBookmarked: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "Recommended for you",
                    style: AppTextStyles.homeSubheading,
                    textAlign: TextAlign.left,
                  ),
                ),
                Gap(5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RecommendedCard(),
                      RecommendedCard(),
                      RecommendedCard(),
                      RecommendedCard(),
                      RecommendedCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

