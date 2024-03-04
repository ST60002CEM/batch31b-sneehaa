import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/hotel_details/data/data_source/hotel_details_remote_datasource.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:bookaway/features/hotel_details/domain/repository/hotel_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelRepositoryProvider = Provider<IHotelDetailsRepository>((ref) {
  return HotelDetailsRemoteRepositoryImpl(
    hotelDetailsRemoteDataSource: ref.read(hotelRemoteDataSourceProvider),
  );
});

class HotelDetailsRemoteRepositoryImpl implements IHotelDetailsRepository {
  final HotelDetailsRemoteDataSource hotelDetailsRemoteDataSource;

  HotelDetailsRemoteRepositoryImpl(
      {required this.hotelDetailsRemoteDataSource});

  @override
  Future<Either<Failure, HotelDetailsEntity>> getHotelById(String hotelId) async {
    return hotelDetailsRemoteDataSource.getHotelById(hotelId);
  }
}
