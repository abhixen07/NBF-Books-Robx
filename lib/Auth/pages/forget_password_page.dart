// import 'dart:ui';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intelliwriter/customwidget/custom_button.dart';
// import 'package:intelliwriter/customwidget/custom_text_field.dart';
// import 'package:intelliwriter/view_model/forget_password_view_model.dart';
// import '../../style/style.dart';
//
// class ForgetPasswordPage extends StatefulWidget {
//   const ForgetPasswordPage({super.key});
//
//   @override
//   State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
// }
//
// class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
//   final forgetPasswordViewModel = Get.put(ForgetPasswordViewModel());
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: screenHeight,
//       width: screenWidth,
//       decoration: BoxDecoration(
//         gradient: linearGradientBackground,
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(onPressed: (){
//             Navigator.pop(context);
//           }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: whiteColor,)),
//         ),
//         backgroundColor: Colors.transparent,
//         body: ListView(
//           children: [
//             SizedBox(height: screenHeight * 0.016),
//
//             /// App Logo
//             Image.asset(
//               'assets/images/intelli_logo.png',
//               height: screenHeight * 0.09,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: screenHeight * 0.03,
//                   vertical: screenHeight * 0.07),
//               child: Form(
//                 key: formKey,
//                 child: Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         vertical: screenHeight * 0.035,
//                       ),
//                       decoration: BoxDecoration(
//                         // color: whiteColor.withOpacity(0.1),
//                         gradient: linearGradientInnerContainer,
//                         boxShadow: [
//                           BoxShadow(
//                               color: blackColor,
//                               offset: Offset(30, 16),
//                               blurRadius: 18,
//                               spreadRadius: 16)
//                         ],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           ShaderMask(
//                             shaderCallback: (bounds) =>
//                                 linearGradientText.createShader(bounds),
//                             child: const Text(
//                               'Forget Password?',
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: whiteColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.04),
//                           // Email Input
//                           CustomTextFormField(
//                             heightlabelbelow: 0,
//                             controller: forgetPasswordViewModel.emailController.value,
//                             hintText: 'Enter Email',
//                             shadowColor: blackColor.withOpacity(0.3),
//                             shadowBlurRadius: 8.0,
//                             shadowOffsetX: 0,
//                             shadowOffsetY: 4.0,
//                             isCenter: true,
//                             borderRadius: 12,
//                             height: screenHeight * 0.065,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Enter Email';
//                               }
//                               if (!EmailValidator.validate(forgetPasswordViewModel.emailController.value.text)) {
//                                 return 'Please enter a valid email address';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.03),
//
//                           // Login Button
//                           Obx(
//                                 () =>  CustomButton(
//                                   title: forgetPasswordViewModel.loading.value
//                                       ? '' // Set title to empty when loading
//                                       : 'Send',
//
//                                   onPress: () {
//                                     if (!forgetPasswordViewModel.loading.value && formKey.currentState!.validate()) {
//                                       forgetPasswordViewModel.sendResetToken(context);
//                                     }
//                                   },
//
//                             width: screenWidth*0.3,
//                                   loading: forgetPasswordViewModel.loading.value,
//                                   loadingIndicatorColor:whiteColor,
//
//                             customGradient: linearGradientSplash,
//                             is3DShadow: true,
//                             borderRadius: 12,
//                             height: screenHeight * 0.05,
//                             fontWeight: FontWeight.w400,
//                           ),
//                 ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
