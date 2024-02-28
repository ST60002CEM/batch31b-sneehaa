import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/core/shared_prefs/user_shared_prefs.dart';
import 'package:bookaway/features/auth/data/model/auth_api_model.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
    (ref) => AuthRemoteDataSource(ref.read(httpServiceProvider)));

class AuthRemoteDataSource {
  final Dio dio;
  // final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource(this.dio);

Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
  try {
    AuthApiModel authApiModel = AuthApiModel.fromEntity(user);
    Response response = await dio.post(ApiEndpoints.register, data: {
      "firstName": authApiModel.firstName,
      "lastName": authApiModel.lastName,
      "email": authApiModel.email,
      "password": authApiModel.password,
    });
    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(Failure(
          error: response.data['message'] ?? 'Unknown error',
          statusCode: response.statusCode.toString()));
    }
  } on DioException catch (e) {
    String errorMessage = e.message ?? 'An unexpected error occurred'; 
    String? statusCode = e.response?.statusCode?.toString();
    if (e.response != null && e.response!.data != null) {
      errorMessage = e.response!.data['message'] ?? errorMessage;
    }
    return Left(Failure(
        error: errorMessage,
        statusCode: statusCode ?? 'Unknown status code'));
  }
}

  //login
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      Response response = await dio.post(ApiEndpoints.login,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        String token = response.data['token'];
        await UserSharedPrefs().setUserToken(token);
        // ignore: unused_local_variable
        final storedToken = await UserSharedPrefs().setUserToken(token);
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0'));
    }
  }
}
