import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: btn2Color),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Title
              const Text(
                "Password Reset",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "Your password has been successfully reset. click confirm to set a new password",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              // Reset Password button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(NamedRoutes.setnewpasswordpage.name);

                  },
                  child: const Text(
                    "Confirm",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
