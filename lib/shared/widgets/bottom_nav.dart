import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

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
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
          ),
          label: 'Home',
          labelStyle: context.textStyles.labelSmall?.copyWith(
            color:
                selectedIndex == 0
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/calendar.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 1
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
          ),
          label: 'Events',
          labelStyle: context.textStyles.labelSmall?.copyWith(
            color:
                selectedIndex == 1
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
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
                      ? context.colors.onPrimary
                      : context.colors.onSurfaceVariant,
            ),
          ),
          label: 'New Event',
          labelStyle: context.textStyles.labelSmall?.copyWith(
            color:
                selectedIndex == 2
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/Search.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 3
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
          ),
          label: 'Search',
          labelStyle: context.textStyles.labelSmall?.copyWith(
            color:
                selectedIndex == 3
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
          ),
        ),
        CurvedNavigationBarItem(
          child: Image.asset(
            'assets/icons/bottom_nav/customer.png',
            height: 28,
            width: 28,
            color:
                selectedIndex == 4
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
          ),
          label: 'Profile',
          labelStyle: context.textStyles.labelSmall?.copyWith(
            color:
                selectedIndex == 4
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
          ),
        ),
      ],

      height: 60,
      index: selectedIndex,
      color: context.colors.surface,
      buttonBackgroundColor: context.colors.primary,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) => onTap(index),
    );
  }
}
