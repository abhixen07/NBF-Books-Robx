import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';

class SplashService {
  /// Start the timer and navigate based on onboarding status
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 5), () async {
      if (context.mounted) {
        await navigateToPage(context);
      }
    });
  }

  /// Decide whether to show the onboarding page or directly navigate to the Free Tools page
  Future<void> navigateToPage(BuildContext context) async {
     final prefs = await SharedPreferences.getInstance();
     final isOnboardingSeen = prefs.getBool('isOnboardingSeen') ?? false;

     // if (isOnboardingSeen) {

      ///Flow
      GoRouter.of(context).pushNamed(NamedRoutes.loginpage.name);

       // context.goNamed(NamedRoutes.onBoardPage.name);

    // } else {

       // context.goNamed(NamedRoutes.homeScreen.name);


       // await prefs.setBool('isOnboardingSeen', true);
     // }
  }
}
