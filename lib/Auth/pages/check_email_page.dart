import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  children: [
                    TextSpan(text: 'We sent a reset link to '),
                    TextSpan(
                      text: 'contact@dscode...com',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(text: '\nEnter 5 digit code that mentioned in the email'),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              /// PIN INPUT
              PinCodeTextField(
                appContext: context,
                length: 5,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: btn2Color,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: screenHeight * 0.08,
                  fieldWidth: screenWidth * 0.14,
                  activeColor: btn2Color,
                  selectedColor: btn2Color,
                  inactiveColor: lightGreyColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                onCompleted: (value) {
                  debugPrint("Entered Code: $value");
                },
              ),

              SizedBox(height: screenHeight * 0.04),

              /// VERIFY BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(NamedRoutes.passwordresetpage.name);
                  },
                  child: const Text(
                    'Verify Code',
                   ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              /// RICH TEXT WITH RESEND EMAIL
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Haven’t got the email yet? ",
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Resend email",
                        style: const TextStyle(
                          color: btn2Color,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                    ],
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
