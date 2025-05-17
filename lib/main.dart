import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      ///display page
      routerDelegate: AppRoutes.instance.router.routerDelegate,
      ///parse into meaningful format
      routeInformationParser: AppRoutes.instance.router.routeInformationParser,
      /// knows current route
      routeInformationProvider: AppRoutes.instance.router.routeInformationProvider,
      //  routerConfig: AppRoutes.instance.router,
      debugShowCheckedModeBanner: false,
      title: 'NBF Book Publications',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),

          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle().copyWith(
              backgroundColor: const WidgetStatePropertyAll(btnColor),
              foregroundColor: const WidgetStatePropertyAll(whiteColor),


              textStyle: const WidgetStatePropertyAll(
                TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),

              ///for size on screen
              minimumSize: const WidgetStatePropertyAll(
                  Size(70, 30)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Inter'
      ),
    );
  }
}
