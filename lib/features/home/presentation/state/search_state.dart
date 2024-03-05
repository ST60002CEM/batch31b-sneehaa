import 'package:bookaway/features/home/domain/entity/home_entity.dart';

class SearchState {
  final bool isLoading;
  final List<HotelEntity> hotels;
  final String? error;

  SearchState({
    required this.isLoading,
    required this.hotels,
    this.error,
  });

  factory SearchState.initial() {
    return SearchState(
      isLoading: false,
      hotels: [],
    );
  }

  SearchState copyWith({
    bool? isLoading,
    List<HotelEntity>? hotels,
    String? error,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      hotels: hotels ?? this.hotels,
      error: error ?? this.error,
    );
  }
}
