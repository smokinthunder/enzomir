import 'package:enzomir/presentation/pages/events/events_page.dart';
import 'package:enzomir/presentation/pages/home/home_page.dart';
import 'package:enzomir/presentation/pages/new_event/new_event_page.dart';
import 'package:enzomir/presentation/pages/profile/profile_page.dart';
import 'package:enzomir/presentation/pages/search/search_page.dart';
import 'package:enzomir/presentation/pre_auth/getstarted_screen.dart';
import 'package:enzomir/presentation/pre_auth/onboarding_screen.dart';
import 'package:enzomir/presentation/root/layout_scaffold.dart';
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
              builder: (context, state) => const NewEventPage(),
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
}
