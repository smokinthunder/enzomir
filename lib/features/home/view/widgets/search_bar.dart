import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,top: 30, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
      child: TextField(
        style: context.textStyles.bodyLarge,
        textAlignVertical: TextAlignVertical(y: 0),
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            'assets/icons/bottom_nav/Search.png',
            height: 28,
            width: 28,
            color: context.colors.onSurfaceVariant,
          ),
          hintText: "Search",
          hintStyle: context.textStyles.bodyLarge,
          focusedBorder: InputBorder.none,
          fillColor: context.colors.surface,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
