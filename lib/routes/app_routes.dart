import 'package:go_router/go_router.dart';
import 'package:nbf_bookpublications_app/Auth/pages/check_email_page.dart';
import 'package:nbf_bookpublications_app/Auth/pages/forget_password_page.dart';
import 'package:nbf_bookpublications_app/Auth/pages/password_reset_page.dart';
import 'package:nbf_bookpublications_app/Auth/pages/set_new_password_page.dart';
import 'package:nbf_bookpublications_app/view/home.dart';
import 'package:nbf_bookpublications_app/splash/splashscreen/onboarding_page.dart';
import 'package:nbf_bookpublications_app/view/checkout_page.dart';
import 'package:nbf_bookpublications_app/view/library/audio_book_page.dart';
import 'package:nbf_bookpublications_app/view/library/library_page.dart';
import 'package:nbf_bookpublications_app/view/payment_page.dart';
import 'package:nbf_bookpublications_app/view/payment_success_page.dart';
import 'package:nbf_bookpublications_app/view/product_details_page.dart';
import '../../splash/splashscreen/splash_screen.dart';
import '../Auth/pages/login_page.dart';
import '../Auth/pages/signup_page.dart';
import '../navbar/navbar_home.dart';
import '../view/pdf_reader.dart';

final class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  static const String splashPage = "/";
  static const String onBoardPage = "/onboardpage";
  static const String loginpage = "/loginpage";
  static const String signuppage = "/signuppage";
  static const String forgetpasswordpage = "/forgetpasswordpage";
  static const String checkemailpage = "/checkemailpage";
  static const String passwordresetpage = "/passwordresetpage";
  static const String setnewpasswordpage = "/setnewpasswordpage";
  static const String homeScreen = "/homeScreen";
  static const String navbarpage = "/navbarpage";
  static const String pdfViewPage = "/pdfViewPage";
  static const String productDetailsPage = "/productDetailsPage";
  static const String checkoutPage = "/checkoutPage";
  static const String paymentPage = "/paymentPage";
  static const String paymentSuccessPage = "/paymentSuccessPage";
  static const String libraryPage = "/libraryPage";
  static const String audioBookPage = "/audioBookPage";





  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splashPage,
      name: NamedRoutes.splashPage.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: onBoardPage,
      name: NamedRoutes.onBoardPage.name,
      builder: (context, state) => const OnBoardingPage(),
    ),

    GoRoute( //temp
      path: homeScreen,
      name: NamedRoutes.homeScreen.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: navbarpage,
        name: NamedRoutes.navbarpage.name,
        builder: (context, state) {
          final initialIndex = int.tryParse(state.uri.queryParameters['index']??'0') ?? 0;
          return NavBarHomePage(
            index: initialIndex,
          );
        }
      //builder: (context, state) => const NavBarHomePage(),
    ),
    GoRoute(
      path: loginpage,
      name: NamedRoutes.loginpage.name,
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: signuppage,
      name: NamedRoutes.signuppage.name,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: forgetpasswordpage,
      name: NamedRoutes.forgetpasswordpage.name,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: checkemailpage,
      name: NamedRoutes.checkemailpage.name,
      builder: (context, state) => const EmailVerificationScreen(),
    ),
    GoRoute(
      path: passwordresetpage,
      name: NamedRoutes.passwordresetpage.name,
      builder: (context, state) => const PasswordResetScreen(),
    ),
    GoRoute(
      path: setnewpasswordpage,
      name: NamedRoutes.setnewpasswordpage.name,
      builder: (context, state) => const SetANewPasswordPage(),
    ),
    GoRoute(
      path: productDetailsPage,
      name: NamedRoutes.productDetailsPage.name,
      builder: (context, state) => const ProductDetailPage(),
    ),
    GoRoute(
      path: checkoutPage,
      name: NamedRoutes.checkoutPage.name,
      builder: (context, state) => const CheckoutPage(),
    ),
    GoRoute(
      path: paymentPage,
      name: NamedRoutes.paymentPage.name,
      builder: (context, state) => const PaymentPage(),
    ),
    GoRoute(
      path: paymentSuccessPage,
      name: NamedRoutes.paymentSuccessPage.name,
      builder: (context, state) => const PaymentSuccessPage(),
    ),
    GoRoute(
      path: libraryPage,
      name: NamedRoutes.libraryPage.name,
      builder: (context, state) => LibraryPage(),
    ),
    GoRoute(
      path: audioBookPage,
      name: NamedRoutes.audioBookPage.name,
      builder: (context, state) => const AudioBookPage(),
    ),
    GoRoute(
      path: AppRoutes.pdfViewPage,
      name: NamedRoutes.pdfViewPage.name,
      builder: (context, state) {
        final pdfPath = state.uri.queryParameters['pdfPath'] ?? '';
        final title = state.uri.queryParameters['title'] ?? '';
        return PdfViewScreen(pdfPath: pdfPath,title: title,);
      },
    ),



  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  splashPage,
  onBoardPage,
  loginpage,
  signuppage,
  forgetpasswordpage,
  checkemailpage,
  passwordresetpage,
  setnewpasswordpage,
  homeScreen,
  navbarpage,
  pdfViewPage,
  productDetailsPage,
  checkoutPage,
  paymentPage,
  paymentSuccessPage,
  libraryPage,
  audioBookPage,




}
