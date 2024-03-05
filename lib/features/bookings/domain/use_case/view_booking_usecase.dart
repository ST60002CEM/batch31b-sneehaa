import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:bookaway/features/bookings/domain/repository/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';


final viewHotelBookingUseCaseProvider =
    Provider.autoDispose<ViewHotelBookingUseCase>(
  (ref) => ViewHotelBookingUseCase(ref.read(hotelBookingRepositoryProvider)),
);

class ViewHotelBookingUseCase {
  final IHotelBookingRepository _hotelBookingRepository;

  ViewHotelBookingUseCase(this._hotelBookingRepository);

  Future<Either<Failure, List<HotelBookingEntity>>> getBookings() async {
    return await _hotelBookingRepository.getBookings();
  }
}
