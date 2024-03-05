import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/core/network/local/hive_service.dart';
import 'package:bookaway/features/home/data/model/home_hive_model.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hotelLocalDataSourceProvider = Provider<HotelLocalDataSource>((ref) {
  return HotelLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    hotelHiveModel: ref.read(hotelHiveModelProvider),
  );
});

class HotelLocalDataSource {
  final HiveService hiveService;
  final HotelHiveModel hotelHiveModel;

  HotelLocalDataSource({
    required this.hiveService,
    required this.hotelHiveModel,
  });

  Future<Either<Failure, List<HotelEntity>>> getAllHotels() async {
    try {
      // Get all hotels from Hive
      final hotels = await hiveService.getAllHotels();
      // Convert Hive Object to Entity
      final hotelEntities = hotelHiveModel.toEntityList(hotels);
      return Right(hotelEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
