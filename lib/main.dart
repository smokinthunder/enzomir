import 'package:enzomir/presentation/home/home_page.dart';
import 'package:enzomir/presentation/pre_auth/getstarted_screen.dart';
import 'package:enzomir/presentation/pre_auth/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: OnboardingScreen(),
    );
  }
}
