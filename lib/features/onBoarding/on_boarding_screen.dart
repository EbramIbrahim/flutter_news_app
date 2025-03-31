import 'package:flutter/material.dart';
import 'package:news_app/features/onBoarding/phone_on_boarding_screen.dart';
import 'package:news_app/features/onBoarding/tablet_on_boarding_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return TabletOnBoardingScreen();
          } else {
            return PhoneOnBoardingScreen();
          }
        },
      ),
    );
  }
}
