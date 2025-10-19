import 'package:enzomir/shared/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNav(
        selectedIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
