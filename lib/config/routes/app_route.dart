import 'package:bookaway/features/auth/presentation/view/register_view.dart';
import 'package:bookaway/screens/home_screen.dart';
import 'package:bookaway/screens/login_screen.dart';
import 'package:bookaway/screens/splash_screen.dart';
import 'package:bookaway/screens/verification_screen.dart';

class AppRoute {
  AppRoute._();

  static const String dashboardRoute = '/';
  static const String signupRoute = '/signup';
  static const String verificationRoute = '/verification';
  static const String loginRoute = '/login';
  static const String splashRoute = '/splash';
  static const String homepageRoute = '/home';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => SplashScreen(),
      signupRoute: (context) => const RegisterView(),
      verificationRoute: (context) => const VerificationScreen(),
      loginRoute: (context) => const LoginScreen(),
      homepageRoute: (context) => const HomeScreen(),
    };
  }
}
