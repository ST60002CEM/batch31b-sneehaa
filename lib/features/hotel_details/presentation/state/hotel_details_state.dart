
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';

class HotelDetailsState {
  final bool isLoading;
  final HotelDetailsEntity? selectedHotel;
  final String? error;

  HotelDetailsState({
    required this.isLoading,
    required this.selectedHotel,
    this.error,
  });

  factory HotelDetailsState.initial() {
    return HotelDetailsState(
      isLoading: false,
      selectedHotel: null,
    );
  }

  HotelDetailsState copyWith({
    bool? isLoading,
    HotelDetailsEntity? selectedHotel,
    String? error,
  }) {
    return HotelDetailsState(
      isLoading: isLoading ?? this.isLoading,
      selectedHotel: selectedHotel ?? this.selectedHotel,
      error: error ?? this.error,
    );
  }
}
