

import 'package:bookaway/screens/signup_screen.dart';

class AppRoute {
  AppRoute._();

  static const String dashboardRoute = '/';
  static const String signupRoute = '/signup';
  static const String verificationRoute = '/verification';

  static getApplicationRoute() {
    return {
      signupRoute: (context) => const SignupScreen(),
      verificationRoute: (context) => const VerificationScreen(),
    };
  }
}
