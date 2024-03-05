
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:bookaway/features/bookings/domain/repository/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookHotelBookingUseCaseProvider = Provider.autoDispose<BookHotelBookingUseCase>(
  (ref) => BookHotelBookingUseCase(ref.read(hotelBookingRepositoryProvider)),
);

class BookHotelBookingUseCase {
  final IHotelBookingRepository _hotelBookingRepository;

  BookHotelBookingUseCase(this._hotelBookingRepository);

  Future<Either<Failure, bool>> bookHotel(
      HotelBookingEntity booking) async {
    return await _hotelBookingRepository.bookHotel(booking);
  }
}
