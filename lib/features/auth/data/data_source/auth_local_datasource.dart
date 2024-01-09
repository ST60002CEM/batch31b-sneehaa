import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/hive_service.dart';
import 'package:bookaway/features/auth/data/model/auth_hive_model.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
  (ref) => AuthLocalDataSource(ref.watch(hiveServiceProvider)),
);

class AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  Future<Either<Failure, bool>> registerUser(AuthEntity entity) async {
    try {
      // Converting auth entity to auth hive model
      AuthHiveModel authHiveModel = AuthHiveModel.toHiveModel(entity);
      // Saving auth hive model to hive
      await _hiveService.registerUser(authHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

}
