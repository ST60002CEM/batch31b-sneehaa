import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
    (ref) => LoginUseCase(ref.watch(authRepositoryProvider)));

class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    return await authRepository.loginUser(email, password);
  }
}