import 'package:flutter/material.dart';

class ProfilePictureWithCamera extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ProfilePictureWithCamera({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(imagePath),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: onTap,
          ),
        ),
      ],
    );
  }
}
