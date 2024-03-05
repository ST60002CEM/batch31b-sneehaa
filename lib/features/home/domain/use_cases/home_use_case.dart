import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/home_entity.dart';


final hotelUsecaseProvider = Provider<HotelUseCase>(
  (ref) => HotelUseCase(
    hotelRepository: ref.watch(hotelRepositoryProvider),
  ),
);

class HotelUseCase {
  final IHotelRepository hotelRepository;

  HotelUseCase({required this.hotelRepository});

  Future<Either<Failure, List<HotelEntity>>> getAllHotels() {
    return hotelRepository.getAllHotels();
  }

}
