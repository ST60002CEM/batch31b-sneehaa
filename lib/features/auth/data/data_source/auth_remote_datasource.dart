import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:bookaway/core/common/provider/flutter_secure_storage.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../domain/entity/auth_entity.dart';
import '../model/auth_api_model.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
    ref.read(httpServiceProvider),
    ref.read(flutterSecureStorageProvider),
  ),
);

class AuthRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AuthRemoteDataSource(this.dio, this.secureStorage);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(user);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "password": apiModel.password,
        },
      );
      if (response.statusCode == 200) {
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

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData =
            response.data as Map<String, dynamic>?;

        if (responseData != null && responseData.containsKey('token')) {
          final token = responseData['token'];

          await secureStorage.write(key: "authenticationToken", value: token);

          final decodedToken = JwtDecoder.decode(token);
          final tokenName = decodedToken['firstName'];

          if (email == tokenName) {
            return const Right(true);
          } else {
            return Left(
              Failure(
                error: response.data?['message'] ?? "Unknown error",
                statusCode: response.statusCode.toString(),
              ),
            );
          }
        } else {
          return Left(
            Failure(
              error: response.data?['message'] ?? "Unknown error",
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          Failure(
            error: response.data?['message'] ?? "Unknown error",
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Left(Failure(error: "Connection timeout. Please try again."));
      } else if (e.type == DioExceptionType.badResponse) {
        return Left(Failure(error: "Server error. Please try again later."));
      } else {
        return Left(Failure(error: "An unexpected error occurred."));
      }
    } catch (e) {
      return Left(Failure(error: "An unexpected error occurred."));
    }
  }
}
