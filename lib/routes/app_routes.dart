import 'package:go_router/go_router.dart';
import 'package:nbf_bookpublications_app/home.dart';
import '../../splash/splashscreen/splash_screen.dart';

final class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  static const String splashPage = "/";
  static const String onBoardPage = "/onboardpage";
  static const String loginpage = "/loginpage";
  static const String signuppage = "/signuppage";
  static const String homeScreen = "/homeScreen";




  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splashPage,
      name: NamedRoutes.splashPage.name,
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: onBoardPage,
    //   name: NamedRoutes.onBoardPage.name,
    //   builder: (context, state) => OnboardingPage(),
    // ),

    GoRoute( //temp
      path: homeScreen,
      name: NamedRoutes.homeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),




    // GoRoute(
    //   path: loginpage,
    //   name: NamedRoutes.loginpage.name,
    //   builder: (context, state) => const LoginPage(),
    // ),
    //
    // GoRoute(
    //   path: signuppage,
    //   name: NamedRoutes.signuppage.name,
    //   builder: (context, state) => const SignUpPage(),
    // ),



  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  splashPage,
  onBoardPage,
  loginpage,
  signuppage,
  homeScreen, //temp


}
