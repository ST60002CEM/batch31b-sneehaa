import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:bookaway/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hotelLocalRepoProvider = Provider<IHotelRepository>((ref) {
  return HotelLocalRepositoryImpl(
    hotelLocalDataSource: ref.read(hotelLocalDataSourceProvider),
  );
});

class HotelLocalRepositoryImpl implements IHotelRepository {
  final HotelLocalDataSource hotelLocalDataSource;

  HotelLocalRepositoryImpl({
    required this.hotelLocalDataSource,
  });


  @override
  Future<Either<Failure, List<HotelEntity>>> getAllHotels() {
    return hotelLocalDataSource.getAllHotels();
  }
}
