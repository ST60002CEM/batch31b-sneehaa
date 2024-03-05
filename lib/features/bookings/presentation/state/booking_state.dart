
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';

class HotelBookingState {
  final bool isLoading;
  final String? error;
  final bool? showMessage;
  final List<HotelBookingEntity>? hotelBookings;

  HotelBookingState({
    required this.isLoading,
    this.error,
    this.showMessage,
    this.hotelBookings,
  });

  factory HotelBookingState.initial() {
    return HotelBookingState(
      isLoading: false,
      error: null,
      showMessage: false,
      hotelBookings: null,
    );
  }

  HotelBookingState copyWith({
    bool? isLoading,
    String? error,
    bool? showMessage,
    List<HotelBookingEntity>? hotelBookings,
  }) {
    return HotelBookingState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
      hotelBookings: hotelBookings ?? this.hotelBookings,
    );
  }

  @override
  String toString() =>
      'HotelBookingState(isLoading: $isLoading, error: $error)';
}
