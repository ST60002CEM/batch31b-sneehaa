
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookaway/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/profile_entity.dart';

final profileRemoteRepositoryProvider = Provider<IProfileRepository>((ref) =>
    ProfileRemoteRepostitory(ref.read(profileRemoteDataSourceProvider)));

class ProfileRemoteRepostitory implements IProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRemoteRepostitory(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProfileEntity>>> getProfile() {
    return remoteDataSource.getProfile();
  }
}
