import 'package:enzomir/features/profile/view/widgets/settings_card.dart';
import 'package:enzomir/shared/widgets/custom_app_bar.dart';
import 'package:enzomir/shared/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Profile"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/profile.jpg',
                    ), // Replace with your image path
                  ),
                  const SizedBox(height: 16),

                  // Name and email
                  Text('Domenic Winget', style: context.textStyles.headlineLarge),
                  const SizedBox(height: 8),
                  Text(
                    'jennydemgmail.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  // Edit button
                  InkWell(
                    onTap: () {
                      context.push(Routes.nestedEditProfilePage);
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: context.textStyles.labelMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SettingsCard(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {
                      // Handle language change
                    },
                  ),
                  SettingsCard(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // Handle password change
                    },
                  ),
                  SettingsCard(
                    icon: Icons.help,
                    title: 'Help',
                    onTap: () {
                      // Handle help
                    },
                  ),
                  SettingsCard(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
