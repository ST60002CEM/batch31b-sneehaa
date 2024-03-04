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
  static String getHotelByIdUrl(String id) {
    return "$baseUrl$getHotelById/$id";
  }
}
