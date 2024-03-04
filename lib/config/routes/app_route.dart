import 'package:bookaway/features/hotel_details/domain/entity/hotel_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:bookaway/features/auth/presentation/view/login_view.dart';
import 'package:bookaway/features/auth/presentation/view/register_view.dart';
import 'package:bookaway/features/home/presentation/view/home_view.dart';
import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String hotelDetailsRoute = '/hotelDetails';

  static getApplicationRoute() {
    return {
      // splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => HomePage(),
      registerRoute: (context) => const RegisterView(),

      hotelDetailsRoute: (context) {
        final hotelDetails = ModalRoute.of(context)?.settings.arguments
            as HotelDetails?;
        return HotelDetailsPage(hotelDetails: hotelDetails);
      },
    };
  }
}
