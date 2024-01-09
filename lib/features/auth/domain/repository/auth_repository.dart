
import 'dart:io';

import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/data/repository/auth_remote_repository.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => ref.read(authRemoteRepositoryProvider),
);

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
