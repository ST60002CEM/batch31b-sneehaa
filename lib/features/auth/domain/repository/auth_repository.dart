import 'package:bookaway/features/auth/data/repository/auth_remote_repository.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';


final authRepositoryProvider =
    Provider((ref) => ref.read(authRemoteRepositoryProvider));

abstract class AuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}

