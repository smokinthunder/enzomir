import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: [
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/home.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 0
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
          ),
          label: 'Home',
          labelStyle: AppTextStyles.botNavTextStyle.copyWith(
            color:
                selectedIndex == 0
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/calendar.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 1
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
          ),
          label: 'Events',
          labelStyle: AppTextStyles.botNavTextStyle.copyWith(
            color:
                selectedIndex == 1
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
          ),
        ),
        CurvedNavigationBarItem(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              'assets/icons/bottom_nav/add.png',
              height: 20,
              width: 20,
              color:
                  selectedIndex == 2
                      ? AppColors.whiteTextColor
                      : AppColors.subtitleTextColor,
            ),
          ),
          label: 'New Event',
          labelStyle: AppTextStyles.botNavTextStyle.copyWith(
            color:
                selectedIndex == 2
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/Search.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 3
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
          ),
          label: 'Search',
          labelStyle: AppTextStyles.botNavTextStyle.copyWith(
            color:
                selectedIndex == 3
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/customer.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 4
                    ? AppColors.whiteTextColor
                    : AppColors.subtitleTextColor,
          ),
          label: 'Profile',
          labelStyle: AppTextStyles.botNavTextStyle.copyWith(
            color:
                selectedIndex == 4
                    ? AppColors.primary
                    : AppColors.subtitleTextColor,
          ),
        ),
      ],

      height: 60,
      index: selectedIndex,
      color: AppColors.background,
      buttonBackgroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) => onTap(index),
    );
  }
}
