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
      floatingActionButton: new FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor:AppColors.primary,
        
        child: new Icon(Icons.add),
        elevation: 4.0,
        onPressed: () {},
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(),

    );
  }
}
