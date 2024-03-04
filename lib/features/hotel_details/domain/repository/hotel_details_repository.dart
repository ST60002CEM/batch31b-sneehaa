import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/remote/http_service.dart';
import 'package:bookaway/features/hotel_details/data/data_source/hotel_details_remote_datasource.dart';
import 'package:bookaway/features/hotel_details/data/repository/hotel_details_repository_impl.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelRemoteDataSourceProvider = Provider(
  (ref) => HotelDetailsRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

final hotelDetailsRepositoryProvider = Provider<IHotelDetailsRepository>((ref) {
  final hotelDetailsRemoteDataSource =
      ref.read(hotelDetailsRemoteDataSourceProvider);

  return HotelDetailsRemoteRepositoryImpl(
      hotelDetailsRemoteDataSource: hotelDetailsRemoteDataSource);
});

abstract class IHotelDetailsRepository {
  Future<Either<Failure, HotelDetails>> getHotelById(String hoteId);
}
