import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

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
        color: context.colors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: context.colors.surface),
          Text(
            text,
            style: TextStyle(
              color: context.colors.surface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
