class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  static const String baseUrl = "http://10.0.2.2:5500/api/";

  // static const String baseUrl = "http://localhost:5500/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/register";
  static const String getAllHotels = "hotel/get_hotels";
  static const String getHotelById = "hotel/get_hotel";
  static const String bookHotel = "booking/book_hotel";
  static const String profile = "user/profile";
  static const String sendOTP = "/send-otp";
  static const String getBookings = '/api/booking';
  static const String verifyandUpdatePassword =
      "/verify-otp-and-update-password";
      static String getHotelByIdUrl(String id) {
    return "$baseUrl$getHotelById/$id";
  }

//  =================== Booking Routes===================

   static const String bookingHotel = "/booking/book_hotel";
  static const String getallbookings = "/booking/delete_booking";
  static const String deleteBooking = "/booking/my-bookings";
  
}
