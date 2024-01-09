import 'dart:io';

import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/data/data_source/auth_local_datasource.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authLocalRepositoryProvider = Provider.autoDispose<IAuthRepository>(
  (ref) => AuthLocalRepository(ref.read(authLocalDataSourceProvider)),
);

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);
  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return _authLocalDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return const Right("");
  }
}
