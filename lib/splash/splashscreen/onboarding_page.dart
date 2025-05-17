// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:i_am_scientist/app/customwidget/custom_button.dart';
// import 'package:i_am_scientist/app/routes/app_routes.dart';
// import 'package:i_am_scientist/app/style/style.dart';
//
// import '../../app/customwidget/gradient_text_widget.dart';
//
// class OnboardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double screenWidth = constraints.maxWidth;
//         double screenHeight = constraints.maxHeight;
//
//         /// Determine font size based on screen width
//         double titleFontSize = screenWidth * 0.06;
//         double bodyFontSize = screenWidth * 0.076;
//         double imageHeight = screenHeight * 0.46;
//         double imageWidth = screenWidth * 0.95;
//         double buttonPadding = screenHeight * 0.05;
//
//         return Container(
//           decoration: BoxDecoration(
//             gradient: linearGradientBackground,
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               centerTitle: true,
//               title: Text(
//                 "I Am Scientist",
//                 style: TextStyle(
//                   fontSize: titleFontSize,
//                   fontWeight: FontWeight.w500,
//                   color: whiteColor,
//                 ),
//               ),
//
//
//
//             ),
//
//             body: ListView(
//               children: [
//                 Column(
//                   children: [
//                     const Divider(
//                       thickness: 0.2,
//                       color: greyColor,
//                     ),
//                     const SizedBox(height: 30),
//                     GradientText(
//                       text: "Welcome\nTo Free Ai Tools",
//                       textStyle: TextStyle(
//                         fontSize: bodyFontSize,
//                         fontWeight: FontWeight.w500,
//                         height: 1.2,
//                       ),
//                       gradient: linearGradientIndicator,
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Image.asset(
//                         'assets/onboarding_logo.png',
//                         fit: BoxFit.cover,
//                         height: imageHeight,
//                         width: imageWidth,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             bottomNavigationBar: Padding(
//               padding: EdgeInsets.all(buttonPadding),
//               child: CustomButton(
//                 title: 'Try It Now',
//                 onPress: () {
//                   context.goNamed(NamedRoutes.aitoolPage.name);
//                   // GoRouter.of(context)
//                   //     .pushNamed(NamedRoutes.loginpage.name);
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
