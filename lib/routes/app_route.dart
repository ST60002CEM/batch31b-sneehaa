import 'dart:js';

import 'package:bookaway/screens/login_screen.dart';

import 'package:bookaway/screens/signup_screen.dart';
import 'package:bookaway/screens/verification_screen.dart';

class AppRoute {
  AppRoute._();

  static const String dashboardRoute = '/';
  static const String signupRoute = '/signup';
  static const String verificationRoute = '/verification';
  static const String loginRoute = '/login';

  static getApplicationRoute() {
    return {
      signupRoute: (context) => const SignupScreen(),
      verificationRoute: (context) => const VerificationScreen(),
      loginRoute: (context) => const LoginScreen(),
    };
  }
}
