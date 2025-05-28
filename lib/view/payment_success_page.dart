import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08, vertical: screenHeight * 0.16),
        children: [
          Center(
            child: Text(
              'Success!',
              style: TextStyle(
                fontSize: screenWidth * 0.13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          // Circular SVG Icon
          Center(
            child: SvgPicture.asset(
              'assets/svgs/check.svg',
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          Text(
            'Thank you for shopping',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your items has been placed and is\non it’s way to being processed',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.black54,
                height: 1.2),
          ),

          SizedBox(height: screenHeight * 0.06),

          // Track Order Button
          TextButton(
            onPressed: () {},
            child: const Text(
              'Track Order',
            ),
          ),
          const SizedBox(height: 12),

          /// Back to Home Button (Outlined)
          OutlinedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(NamedRoutes.navbarpage.name,queryParameters: {
                'index':'0',
              });
            },

            child: const Text(
              'Back to Home',
            ),
          ),
        ],
      ),
    );
  }
}
