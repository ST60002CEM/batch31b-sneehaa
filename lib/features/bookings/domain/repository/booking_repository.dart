import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IBookingRepository {
  Future<Either<Failure, List<BookingEntity>>> getBookings(int page);
  // Add other booking-related methods as needed
}
