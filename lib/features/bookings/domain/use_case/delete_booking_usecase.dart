import 'package:bookaway/features/bookings/domain/repository/booking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteHotelBookingUseCaseProvider =
    Provider.autoDispose<DeleteHotelBookingUseCase>(
  (ref) => DeleteHotelBookingUseCase(ref.read(hotelBookingRepositoryProvider)),
);

class DeleteHotelBookingUseCase {
  final IHotelBookingRepository _hotelBookingRepository;
  DeleteHotelBookingUseCase(this._hotelBookingRepository);

  Future<void> deleteBooking(String bookingId) async {
    await _hotelBookingRepository.deleteBooking(bookingId);
  }
}
