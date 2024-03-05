import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/core/shared_prefs/user_shared_prefs.dart';
import 'package:bookaway/features/home/data/model/home_api_model.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/get_all_hotels_dto.dart';

final hotelRemoteDataSourceProvider = Provider(
  (ref) => HotelRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      hotelApiModel: ref.read(hotelApiModelProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider)),
);

class HotelRemoteDataSource {
  final Dio dio;
  final HotelApiModel hotelApiModel;
  final UserSharedPrefs userSharedPrefs;

  HotelRemoteDataSource({
    required this.dio,
    required this.hotelApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<HotelEntity>>> getAllHotels() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllHotels);
      if (response.statusCode == 200) {
        if (response.data != null) {
          GetAllHotelsDTO getAllHotelsDTO =
              GetAllHotelsDTO.fromJson(response.data);
          return Right(hotelApiModel.toEntityList(getAllHotelsDTO.data));
        } else {
          // Handle null data case
          return Left(
            Failure(
              error: "Response data is null",
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
