import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../style/style.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding.png', // your background image path
              fit: BoxFit.cover,
            ),
          ),

          /// Button Positioned Near Bottom Center
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: TextButton(
                style: ButtonStyle().copyWith(
                  textStyle: const WidgetStatePropertyAll(
                    TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(btnColor),
                ),
                onPressed: () {
                  // context.goNamed(NamedRoutes.loginpage.name);
                  context.goNamed(NamedRoutes.navbarpage.name);

                },
                child: const Text(
                  'Get Started',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
