import 'package:flutter/material.dart';

import '../../style/style.dart';
import '../splashservice/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashService().startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: linearGradientBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: screenHeight * 0.05),

            /// Logo

            /// Text under logo, aligned left but centered block
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                    width: screenWidth * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'National Book Foundation',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Ministry of Federal Education & Professional Training\nGovernment Of Pakistan',
                    style: TextStyle(
                      fontSize: screenWidth * 0.027,
                      color: whiteColor,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),

            /// Book Image at bottom
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.06),
              child: Image.asset(
                'assets/images/books_splash.png',
                width: screenWidth * 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
