import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:nbf_bookpublications_app/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class SetANewPasswordPage extends StatelessWidget {
  const SetANewPasswordPage({super.key});

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
                "Set a new Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "Create a new password. Ensure it differs from previous ones for security",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              CustomTextFormField(
                label: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              CustomTextFormField(
                label: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 30),

              // Reset Password button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(NamedRoutes.loginpage.name);

                  },
                  child: const Text(
                    "Update Password",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
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
