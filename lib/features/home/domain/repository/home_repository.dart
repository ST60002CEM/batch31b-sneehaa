import 'package:bookaway/core/common/provider/is_network_provider.dart';
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/home/data/repository/home_local_repo_impl.dart';
import 'package:bookaway/features/home/data/repository/home_remote_repo_impl.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hotelRepositoryProvider = Provider<IHotelRepository>(
  (ref) {
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      return ref.watch(hotelRemoteRepoProvider);
    } else {
      return ref.watch(hotelLocalRepoProvider);
    }
  },
);

abstract class IHotelRepository {
  Future<Either<Failure, List<HotelEntity>>> getAllHotels();
}
