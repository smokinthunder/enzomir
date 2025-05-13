import 'package:enzomir/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class HomeFilterIcon extends StatelessWidget {
  const HomeFilterIcon({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: AppColors.pureWhite),
          Text(
            text,
            style: TextStyle(
              color: AppColors.pureWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
