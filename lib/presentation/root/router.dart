import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/features/auth/presentation/pages/login_page.dart';
import 'package:enzomir/features/auth/presentation/pages/signup_page.dart';
import 'package:enzomir/presentation/pages/events/events_page.dart';
import 'package:enzomir/presentation/pages/home/home_page.dart';
import 'package:enzomir/presentation/pages/new_event/new_event_page.dart';
import 'package:enzomir/features/auth/presentation/pages/profile_page.dart';
import 'package:enzomir/features/auth/presentation/widgets/edit_profile_page.dart';
import 'package:enzomir/presentation/pages/search/search_page.dart';
import 'package:enzomir/presentation/pre_auth/getstarted_screen.dart';
import 'package:enzomir/presentation/pre_auth/onboarding_screen.dart';
import 'package:enzomir/presentation/root/layout_scaffold.dart';
import 'package:enzomir/presentation/root/root_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  final bool isLoggedin;
  AppRouter(this.isLoggedin);

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // initialLocation: Routes.root,
    redirect: (context, state) async {
      // final cubit = context.read<AppUserCubit>();
      final prefs = await SharedPreferences.getInstance();
      final isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;

      // final appState = cubit.state;

      if (isFirstTime) {
        return Routes.onboardingPage;
      } else if (isLoggedin&& (state.path == Routes.homePage)) {
        return Routes.homePage;
      } else if (!isLoggedin && (state.path == Routes.getStartedPage)) {
        return Routes.getStartedPage;
      }

      return null; // stay
    },
    routes: appRoutes,
  );
}

class Routes {
  Routes._();
  static const String homePage = '/home';
  static const String eventsPage = '/events';
  static const String newEventPage = '/new-event';
  static const String searchPage = '/search';
  static const String profilePage = '/profile';
  static const String onboardingPage = '/onboarding';
  static const String getStartedPage = '/get-started';
  static const String editProfilePage = 'edit-profile';
  static const String nestedEditProfilePage = '/profile/edit-profile';
  static const String loginPage = '/login';
  static const String signUpPage = '/signup';
  static const String root = '/';
}

final List<RouteBase> appRoutes = [
  // This is the root route
  GoRoute(
    path: Routes.root,
    builder: (context, state) {
      return const RootRoute();
    },
  ),
  //Pre auth routes
  GoRoute(
    path: Routes.onboardingPage,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.getStartedPage,
    builder: (context, state) => const GetstartedScreen(),
  ),
  GoRoute(path: Routes.loginPage, builder: (context, state) => LoginPage()),
  GoRoute(path: Routes.signUpPage, builder: (context, state) => SignupPage()),
  // This is the main route
  StatefulShellRoute.indexedStack(
    builder:
        (context, state, navigationShell) =>
            LayoutScaffold(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.homePage,
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.eventsPage,
            builder: (context, state) => const EventsPage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.newEventPage,
            builder: (context, state) => NewEventPage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.searchPage,
            builder: (context, state) => const SearchPage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.profilePage,
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: Routes.editProfilePage,
                builder: (context, state) => const EditProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
