import 'dart:io';

import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authRemoteRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  ),
);

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    return await _authRemoteDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }
}
