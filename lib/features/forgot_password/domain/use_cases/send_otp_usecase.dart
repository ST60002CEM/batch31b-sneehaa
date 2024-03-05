import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/forgot_password/domain/repository/otp_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final sendOTPUseCaseProvider = Provider.autoDispose<SendOTPUseCase>(
    (ref) => SendOTPUseCase(ref.watch(otpRepositoryProvider)));

class SendOTPUseCase {
  final IOTPRepository _otpRepository;

  SendOTPUseCase(this._otpRepository);

  Future<Either<Failure, bool>> sendOTP(String email) {
    return _otpRepository.sendOTP(email);
  }
}
