import 'dart:io';

import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadImageUseCaseProvider = Provider.autoDispose<UploadImageUseCase>(
  (ref) => UploadImageUseCase(ref.read(authRepositoryProvider)),
);

class UploadImageUseCase {
  final IAuthRepository _authRepository;

  UploadImageUseCase(this._authRepository);

  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return await _authRepository.uploadProfilePicture(file);
  }
}
