import 'package:bookaway/core/common/provider/flutter_secure_storage.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/features/bookings/data/model/booking_api_model.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';

final hotelBookingRemoteDataSourceProvider =
    Provider<HotelBookingRemoteDataSource>(
  (ref) => HotelBookingRemoteDataSource(
    ref.read(httpServiceProvider),
    ref.read(flutterSecureStorageProvider),
  ),
);

class HotelBookingRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  HotelBookingRemoteDataSource(this.dio, this.secureStorage);

  Future<Either<Failure, bool>> createBooking(
      HotelBookingEntity hotelBookingEntity) async {
    try {
      final token = await secureStorage.read(key: "authenticationToken");
      if (token == null) {
        return Left(Failure(error: "Token not found"));
      }

      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['id'];
      if (userId == null) {
        return Left(Failure(error: "User ID not found in token"));
      }

      HotelBookingApiModel apiModel =
          HotelBookingApiModel.fromEntity(hotelBookingEntity);

      Response response = await dio.post(
        ApiEndpoints.bookHotel,
        data: {
          "userId": userId,
          "hotelId": apiModel.hotelId,
          "checkInDate": apiModel.checkInDate,
          "checkOutDate": apiModel.checkOutDate,
          "adults": apiModel.adults,
          "children": apiModel.children,
          "rooms": apiModel.rooms,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, List<HotelBookingEntity>>> getBookings() async {
    try {
      final token = await secureStorage.read(key: "authenticationToken");
      if (token == null) {
        return Left(Failure(error: "Token not found"));
      }

      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['id'];
      if (userId == null) {
        return Left(Failure(error: "User ID not found in token"));
      }

      Response response = await dio.get(
        ApiEndpoints.getallbookings,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data.containsKey("bookings")) {
          var bookingJsonList = response.data["bookings"] as List<dynamic>;
          List<HotelBookingEntity> bookings = bookingJsonList
              .map((booking) =>
                  HotelBookingApiModel.fromJson(booking).toEntity())
              .toList();
          return Right(bookings);
        } else {
          return Left(
            Failure(
              error: "Bookings key not found in response data",
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteBooking(String bookingId) async {
    try {
      final token = await secureStorage.read(key: "authenticationToken");
      if (token == null) {
        return Left(Failure(error: "Token not found"));
      }

      Response response = await dio.delete(
        "${ApiEndpoints.deleteBooking}/$bookingId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
