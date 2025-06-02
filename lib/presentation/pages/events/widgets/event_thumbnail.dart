import 'package:flutter/material.dart';

class EventThumbnail extends StatelessWidget {
  final String image;

  const EventThumbnail({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      height: 175,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}
