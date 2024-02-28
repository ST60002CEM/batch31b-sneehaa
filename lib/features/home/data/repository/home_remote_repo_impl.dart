import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookaway/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/home_entity.dart';


final hotelRemoteRepoProvider = Provider<IHotelRepository>((ref) {
  return HotelRemoteRepositoryImpl(
    hotelRemoteDataSource: ref.read(hotelRemoteDataSourceProvider),
  );
});

class HotelRemoteRepositoryImpl implements IHotelRepository {
  final HotelRemoteDataSource hotelRemoteDataSource;

  HotelRemoteRepositoryImpl({required this.hotelRemoteDataSource});


  @override
  Future<Either<Failure, List<HotelEntity>>> getAllHotels() {
    return hotelRemoteDataSource.getAllHotels();
  }
}
