import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/features/profile/data/model/profile_api_model.dart';
import 'package:bookaway/features/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>(
  (ref) => ProfileRemoteDataSource(
    sharedPreferences: ref.read(sharedPreferencesProvider),
    dio: ref.read(httpServiceProvider),
  ),
);

class ProfileRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  ProfileRemoteDataSource({required this.dio, required this.sharedPreferences});

  // Get User Profile by userId
  Future<Either<Failure, List<ProfileEntity>>> getProfile() async {
    try {
      final token = sharedPreferences.getString("authToken");
      if (token == null) {
        return Left(Failure(error: "Token not found"));
      }

      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['id'];
      if (userId == null) {
        return Left(Failure(error: "User ID not found in token"));
      }

      Response response = await dio.get(
        '${ApiEndpoints.profile}/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("userProfile")) {
          var userJson = responseData["userProfile"] as Map<String, dynamic>;
          ProfileEntity user = ProfileApiModel.fromJson(userJson).toEntity();
          return Right([user]);
        }
      } else {
        return Left(
          Failure(
            error: response.statusMessage ?? "Failed to get profile",
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout) {
        return Left(Failure(error: "Connection timeout. Please try again."));
      } else if (e.type == DioExceptionType.badResponse) {
        return Left(
            Failure(error: "Error occurred: ${e.response?.statusCode}"));
      } else {
        return Left(Failure(error: "An unexpected error occurred."));
      }
    } catch (e) {
      print("Caught exception: $e");
      return Left(Failure(error: "An unexpected error occurred: $e"));
    }
    throw UnimplementedError();
  }
}
