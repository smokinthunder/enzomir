import 'package:enzomir/features/profile/view/widgets/email_field.dart';
import 'package:enzomir/features/profile/view/widgets/name_field.dart';
import 'package:enzomir/features/profile/view/widgets/profile_picture_with_camera.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: Theme.of(context).textTheme.bodyMedium),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colors.onSurface,
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
