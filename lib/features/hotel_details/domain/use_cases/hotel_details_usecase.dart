import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:bookaway/features/hotel_details/domain/repository/hotel_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelDetailsUseCaseProvider = Provider<HotelDetailsUseCase>((ref) {
  final repository = ref.read(hotelDetailsRepositoryProvider);
  return HotelDetailsUseCase(hotelDetailsRepository: repository);
});

class HotelDetailsUseCase {
  final IHotelDetailsRepository hotelDetailsRepository;

  HotelDetailsUseCase({required this.hotelDetailsRepository});

  Future<Either<Failure, HotelDetailsEntity>> getHotelById(String hotelId) {
    return hotelDetailsRepository.getHotelById(hotelId);
  }
}
