import 'package:bookaway/features/bookings/presentation/view/view_hotel/view_booking.dart';
import 'package:bookaway/features/forgot_password/presentation/view/send_otp_page.dart';
import 'package:bookaway/features/forgot_password/presentation/view/verify_otp_page.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart';
import 'package:bookaway/features/profile/presentation/view/user_profile_view.dart';
import 'package:bookaway/features/auth/presentation/view/login_view.dart';
import 'package:bookaway/features/auth/presentation/view/register_view.dart';
import 'package:bookaway/features/home/presentation/view/home_view.dart';
import 'package:flutter/widgets.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String hotelDetailsRoute = '/hotelDetails';
  static const String profileRoute = '/profile';
  static const String verifyOTP = "/verifyOTP";
  static const String sendOTP = "/sendOTP";
  static const String viewbookedhotels = '/viewbookedhotels';

  static getApplicationRoute() {
    return {
      loginRoute: (context) => const MyLogin(),
      homeRoute: (context) => const HomePage(),
      registerRoute: (context) => const MyRegister(),
      profileRoute: (context) => const UserProfilePage(),
      verifyOTP: (context) => const VerifyOTPPage(),
      sendOTP: (context) => const SendOTPView(),
      viewbookedhotels: (context) => const ViewBookedHotels(),
      hotelDetailsRoute: (context) {
        final hotelDetailsEntity =
            ModalRoute.of(context)?.settings.arguments as HotelDetailsEntity;
        return HotelDetailsPage(hotelDetailsEntity: hotelDetailsEntity);
      }
    };
  }
}
