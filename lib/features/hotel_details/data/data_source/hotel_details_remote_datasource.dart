import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelDetailsRemoteDataSourceProvider = Provider(
  (ref) => HotelDetailsRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class HotelDetailsRemoteDataSource {
  final Dio dio;

  HotelDetailsRemoteDataSource({
    required this.dio,
  });

  Future<Either<Failure, HotelDetailsEntity>> getHotelById(String hotelId) async {
    try {
      final response = await dio.get(ApiEndpoints.getHotelByIdUrl(hotelId));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final hotelDetails = HotelDetailsEntity(
          hotelId: data['_id'],
          hotelName: data['hotelName'],
          hotelPrice: data['hotelPrice'],
          hotelDescription: data['hotelDescription'],
          hotelCategory: data['hotelCategory'],
          hotelImageUrl: data['hotelImageUrl'],
        );
        return Right(hotelDetails);
      } else {
        return Left(
          Failure(
            error: response.statusMessage ?? "Failed to fetch hotel",
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }
}
