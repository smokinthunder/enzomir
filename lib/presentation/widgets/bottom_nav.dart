import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return CurvedNavigationBar(
          items: [
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/bottom_nav/home.png',
                height: 28,
                width: 28,
                color: newIndex == 0
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
              ),
              label: 'Home',
              labelStyle: AppTextStyles.botNavTextStyle.copyWith(
                color: newIndex == 0
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/bottom_nav/calendar.png',
                height: 28,
                width: 28,
                color: newIndex == 1
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
              ),
              label: 'Events',
              labelStyle: AppTextStyles.botNavTextStyle.copyWith(
                color: newIndex == 1
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/bottom_nav/add.png',
                height: 24,
                width: 24,
                color: newIndex == 2
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
              ),
              label: 'New Event',
              labelStyle: AppTextStyles.botNavTextStyle.copyWith(
                color: newIndex == 2
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/bottom_nav/chat_bubble.png',
                height: 28,
                width: 28,
                color: newIndex == 3
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
              ),
              label: 'Message',
              labelStyle: AppTextStyles.botNavTextStyle.copyWith(
                color: newIndex == 3
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/bottom_nav/customer.png',
                height: 28,
                width: 28,
                color: newIndex == 4
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
              ),
              label: 'Profile',
              labelStyle: AppTextStyles.botNavTextStyle.copyWith(
                color: newIndex == 4
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
              ),
            ),
          ],

          height: 60,
          index: newIndex,
          color: AppColors.background,
          buttonBackgroundColor: AppColors.primary,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            indexChangeNotifier.value = index;
            // Handle navigation logic here
            // For example, you can use a switch case to navigate to different pages
            // based on the index value.
          },
        );
      },
    );
  }
}
