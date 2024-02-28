import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRemoteRepositoy(ref.read(authRemoteDataSourceProvider)));

class AuthRemoteRepositoy implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepositoy(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    return await _authRemoteDataSource.registerUser(user);
  }
  //login 
   @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    return await _authRemoteDataSource.loginUser(email, password);
  }
}