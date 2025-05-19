import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_routes.dart';
import '../../style/style.dart';
import '../../widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.05),
          Image.asset(
            'assets/images/auth_logo.png',
            height: screenHeight * 0.08,
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: screenHeight*0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(color: blackColor, fontSize: 13),
                        children: [
                          TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context).pushNamed(NamedRoutes.loginpage.name);
                              },
                            style: const TextStyle(
                              color: btnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Row(
                    children: [
                      const Expanded(child:
                      CustomTextFormField(
                        label: 'First Name',
                      ),),
                      SizedBox(width: screenWidth*0.05,),
                      const Expanded(child:
                      CustomTextFormField(
                      label: 'Last Name',
                        borderRadius: 12,
                      ),)
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  // Email Input
                  const CustomTextFormField(
                    label: 'Email',
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  // Password Input
                  const CustomTextFormField(
                    label: 'Set Password',
                    obscureText: true,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  const CustomTextFormField(
                    label: 'Confirm Password',
                    obscureText: true,
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  TextButton(onPressed: (){}, child:  const Text(
                    'Register',
                  ),),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),

    );
  }
}
