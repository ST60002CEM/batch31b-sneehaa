
import 'package:bookaway/core/failure/failure.dart';
import 'package:bookaway/features/bookings/data/datasource/booking_remote_datasource.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:bookaway/features/bookings/domain/repository/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hotelBookingRemoteRepositoryProvider = Provider<IHotelBookingRepository>(
  (ref) => HotelBookingRemoteRepository(
    ref.read(hotelBookingRemoteDataSourceProvider),
  ),
);

class HotelBookingRemoteRepository implements IHotelBookingRepository {
  final HotelBookingRemoteDataSource _hotelBookingRemoteDataSource;

  HotelBookingRemoteRepository(this._hotelBookingRemoteDataSource);
  
  @override
  Future<Either<Failure, bool>> bookHotel(HotelBookingEntity booking) {
    return _hotelBookingRemoteDataSource.createBooking(booking);
  }

  @override
  Future<Either<Failure, List<HotelBookingEntity>>> getBookings() {
    return _hotelBookingRemoteDataSource.getBookings();
  }

  @override
  Future<Either<Failure, bool>> deleteBooking(String bookingId) {
    return _hotelBookingRemoteDataSource.deleteBooking(bookingId);
  }

}
