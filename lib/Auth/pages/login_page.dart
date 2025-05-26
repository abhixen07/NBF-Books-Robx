import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import '../../routes/app_routes.dart';
import '../../style/style.dart';
import '../../widgets/custom_check_box_widget.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        'Get Started now',
                        style: TextStyle(
                          fontSize: screenHeight*0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        'Create an account or log in to explore our app',
                        style: TextStyle(fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const CustomTextFormField(
                      label: 'Email',
                    ),
                    const SizedBox(height: 16),
                    const CustomTextFormField(
                      label: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCheckboxGroup(
                          options: const [
                            Text(
                              'Remember me',
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(NamedRoutes.forgetpasswordpage.name);
                          },
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              fontSize: 14,
                              color: btnColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextButton(onPressed: (){
                      context.goNamed(NamedRoutes.navbarpage.name);
                    }, child:  const Text(
                      'Log In',
                    ),),

                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: btnColor),
                          ),
                          child: SvgPicture.asset('assets/svgs/fb_svg.svg',height: 40,),),
                        SizedBox(width: screenWidth*0.07),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: btnColor),
                          ),
                          child: SvgPicture.asset('assets/svgs/google_svg.svg',height: 33,),),
                      ],
                    ),

                    const SizedBox(height: 22),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: blackColor, fontSize: 13),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  GoRouter.of(context).pushNamed(NamedRoutes.signuppage.name);
                                },
                              style: const TextStyle(
                                color: btnColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),

    );
  }
}
