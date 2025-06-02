import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/core/text_styles.dart';
import 'package:enzomir/presentation/pages/profile/widgets/email_field.dart';
import 'package:enzomir/presentation/pages/profile/widgets/name_field.dart';
import 'package:enzomir/presentation/pages/profile/widgets/profile_picture_with_camera.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: AppTextStyles.homeSubheading),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.whiteButtonTextColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture with camera icon
            ProfilePictureWithCamera(
              imagePath: 'assets/profile.jpg', // Replace with your image path
              onTap: () {
                // Handle camera tap logic
              },
            ),
            const SizedBox(height: 32),

            NameField(name: 'Dominic Winget'),
            EmailField(email: 'jennydemgmail.com'),

            // Add other editable fields here if needed
          ],
        ),
      ),
    );
  }
}
