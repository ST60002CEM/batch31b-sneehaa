import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/forgot_password/data/repository/otp_remote_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final otpRepositoryProvider =
    Provider<IOTPRepository>((ref) => ref.read(otpRemoteRepositoryProvider));

abstract class IOTPRepository {
  Future<Either<Failure, bool>> sendOTP(String email);

  Future<Either<Failure, bool>> verifyandUpdateOTP(
      String email, String otp, String newPassword);
}
