import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
      bottomNavigationBar: BottomNav(),

    );
  }
}
