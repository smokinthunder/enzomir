import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:enzomir/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:enzomir/features/auth/presentation/widgets/settings_card.dart';
import 'package:enzomir/presentation/pages/widgets/custom_app_bar.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

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
                      '',
                    ), // Replace with your image path
                  ),
                  const SizedBox(height: 16),

                  // Name and email
                  BlocBuilder<AppUserCubit, AppUserState>(
                    builder: (context, state) {
                      return Text(
                        state is AppUserLoggedIn ? state.user.name : 'Guest',
                        style: AppTextStyles.profileName,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<AppUserCubit, AppUserState>(
                    builder: (context, state) {
                      return Text(
                        state is AppUserLoggedIn ? state.user.email : '',
                        style: AppTextStyles.searchDetails1,
                      );
                    },
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
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: AppTextStyles.editButtonText,
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
                      context.read<AuthBloc>().add(AuthLogOut());
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
