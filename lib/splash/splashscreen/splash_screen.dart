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
        decoration: BoxDecoration(
          gradient: linearGradientBackground,
        ),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.1),


            Center(
              child: Image.asset(
                'assets/images/app_logo.png',
                width: screenWidth * 0.3,
              ),
            ),
            /// Text under logo, left-aligned
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'National Book Foundation',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Ministry of Federal Education & Professional Training\nGovernment Of Pakistan',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: whiteColor,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),


            /// Bottom Image of Books
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.05),
              child: Image.asset(
                'assets/images/books_splash.png', // replace with your correct asset path
                width: screenWidth * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
