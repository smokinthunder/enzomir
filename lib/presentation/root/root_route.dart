import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/core/common/presentation/widgets/loader.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootRoute extends StatelessWidget {
  const RootRoute({super.key});

  Future<void> _handleUserState(
    AppUserState state,
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;

    if (isFirstTime) {
      context.go(Routes.onboardingPage);
    } else if (state is AppUserLoggedIn) {
      context.go(Routes.homePage);
    } else {
      context.go(Routes.getStartedPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        _handleUserState(state, context);
        return const Loader();
      },
    );
  }
}
