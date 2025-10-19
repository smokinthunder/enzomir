import 'package:enzomir/shared/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(40),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => context.go(Routes.getStartedPage),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Colors.black54,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
