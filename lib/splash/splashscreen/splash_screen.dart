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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: screenHeight * 0.1),

            /// Logo at top center
            Center(
              child: Image.asset(
                'assets/images/app_logo.png',
                width: screenWidth * 0.35,
              ),
            ),

            /// Middle Text
            Column(
              children: [
                Text(
                  'National Book Foundation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Ministry of Federal Education & Professional Training\nGovernment Of Pakistan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: whiteColor,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
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
