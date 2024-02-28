import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';


final registerUseCaseProvider = Provider.autoDispose<RegisterUseCase>(
    (ref) => RegisterUseCase(ref.read(authRepositoryProvider)));

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<Failure, bool>> registerUser(AuthEntity entity) async {
    return await authRepository.registerUser(entity);
  }
}