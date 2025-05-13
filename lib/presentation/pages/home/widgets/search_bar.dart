import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,top: 30, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
      child: TextField(
        style: AppTextStyles.hintTextSearch,
        textAlignVertical: TextAlignVertical(y: 0),
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            'assets/icons/bottom_nav/Search.png',
            height: 28,
            width: 28,
            color: AppColors.hintTextColor,
          ),
          hintText: "Search",
          hintStyle: AppTextStyles.hintTextSearch,
          focusedBorder: InputBorder.none,
          fillColor: AppColors.pureWhite,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
