
import 'package:bookaway/screens/login_screen.dart';

class AppRoute {
  AppRoute._();

  static const String dashboardRoute = '/';
  static const String signupRoute = '/signup';
  static const String verificationRoute = '/verification';
  static const String loginRoute = '/login';

  static getApplicationRoute() {
    return {
      // signupRoute: (context) => const SignupScreen(),
      // verificationRoute: (context) => const VerificationScreen(),
      loginRoute: (context) => const LoginScreen(),
    };
  }
}
