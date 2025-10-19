import 'package:enzomir/core/theme/theme.dart';
import 'package:enzomir/shared/navigation/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Enzomir',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      
      // Professional Theme Configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Follows system preference
    );
  }
}
