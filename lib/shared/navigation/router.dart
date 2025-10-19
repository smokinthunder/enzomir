import 'package:enzomir/features/auth/view/pages/login_page.dart';
import 'package:enzomir/features/auth/view/pages/signup_page.dart';
import 'package:enzomir/features/events/view/pages/events_page.dart';
import 'package:enzomir/features/home/view/pages/home_page.dart';
import 'package:enzomir/features/events/view/pages/new_event_page.dart';
import 'package:enzomir/features/profile/view/pages/profile_page.dart';
import 'package:enzomir/features/profile/view/widgets/edit_profile_page.dart';
import 'package:enzomir/features/search/view/pages/search_page.dart';
import 'package:enzomir/features/onboarding/view/pages/getstarted_screen.dart';
import 'package:enzomir/features/onboarding/view/pages/onboarding_screen.dart';
import 'package:enzomir/shared/navigation/layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homePage,
  routes: [
    // This is the root route
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
  ],
);

class Routes {
  Routes._();
  static const String homePage = '/';
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
}
