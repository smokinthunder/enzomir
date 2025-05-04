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
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) => indexChangeNotifier.value = index,
          selectedLabelStyle: AppTextStyles.botNavTextStyle,
          unselectedLabelStyle: AppTextStyles.botNavTextStyle,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.subtitleTextColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_nav/home.png",
                height: 30,
                color:
                    newIndex == 0
                        ? AppColors.primary
                        : AppColors.subtitleTextColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_nav/calendar.png",
                height: 30,
                color:
                    newIndex == 1
                        ? AppColors.primary
                        : AppColors.subtitleTextColor,
              ),
              label: "Events",
            ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     height: 60,
            //     padding: EdgeInsets.all(18),
            //     decoration: BoxDecoration(
            //     color: AppColors.primary,
                  
            //       shape: BoxShape.circle),
            //     child: Image.asset(
            //       "assets/icons/bottom_nav/add.png",
            //       height: 25,
            //       color:
            //           newIndex == 2
            //               ? AppColors.background
            //               : AppColors.background,
            //     ),
            //   ),
            //   label: "",
            // ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_nav/chat_bubble.png",
                height: 30,
                color:
                    newIndex == 3
                        ? AppColors.primary
                        : AppColors.subtitleTextColor,
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_nav/customer.png",
                height: 30,
                color:
                    newIndex == 4
                        ? AppColors.primary
                        : AppColors.subtitleTextColor,
              ),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
