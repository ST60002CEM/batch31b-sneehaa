

import 'package:bookaway/features/auth/presentation/view/login_view.dart';
import 'package:bookaway/features/auth/presentation/view/register_view.dart';
import 'package:bookaway/screens/bottomview/home_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoute() {
    return {
      // splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const RegisterView(),
    };
  }
}