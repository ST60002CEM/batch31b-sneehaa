

import 'package:bookaway/features/home/domain/entity/home_entity.dart';

class HotelState {
  final bool isLoading;
  final List<HotelEntity> hotels;
  final String? error;

  HotelState({
    required this.isLoading,
    required this.hotels,
    this.error,
  });

  factory HotelState.initial() {
    return HotelState(
      isLoading: false,
      hotels: [],
    );
  }

  HotelState copyWith({
    bool? isLoading,
    List<HotelEntity>? hotels,
    String? error,
  }) {
    return HotelState(
      isLoading: isLoading ?? this.isLoading,
      hotels: hotels ?? this.hotels,
      error: error ?? this.error,
    );
  }
}
