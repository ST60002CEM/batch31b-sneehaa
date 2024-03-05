
import 'package:bookaway/features/bookings/data/repository/booking_remote_repo_impl.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

final hotelBookingRepositoryProvider = Provider<IHotelBookingRepository>(
  (ref) => ref.read(hotelBookingRemoteRepositoryProvider),
);

abstract class IHotelBookingRepository {
  // Book Hotel
  Future<Either<Failure, bool>> bookHotel(HotelBookingEntity booking);

  // Get Hotel Bookings
  Future<Either<Failure, List<HotelBookingEntity>>> getBookings();

  // Delete Hotel Booking
  Future<Either<Failure, bool>> deleteBooking(String bookingId);

}
