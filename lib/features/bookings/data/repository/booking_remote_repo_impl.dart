// import 'package:bookaway/core/failure/failure.dart';
// import 'package:bookaway/features/bookings/data/datasource/booking_remote_datasource.dart';
// import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
// import 'package:bookaway/features/bookings/domain/repository/booking_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final bookingRemoteRepositoryProvider =
//     Provider<IBookingRepository>((ref) => BookingRemoteRepository(ref.read));

// class BookingRemoteRepository implements IBookingRepository {
//   final BookingRemoteDataSource remoteDataSource;

//   BookingRemoteRepository(this.remoteDataSource);

//   @override
//   Future<Either<Failure, List<BookingEntity>>> getBookings() {
//     return remoteDataSource.getBookings();
//   }
// }
