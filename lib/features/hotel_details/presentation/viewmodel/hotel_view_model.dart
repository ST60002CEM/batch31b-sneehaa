import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';


// Inside HotelDetailsViewModel class
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookaway/features/hotel_details/domain/use_cases/hotel_details_usecase.dart';
import 'package:bookaway/features/hotel_details/presentation/state/hotel_details_state.dart';

final hotelDetailsViewModelProvider =
    StateNotifierProvider<HotelDetailsViewModel, HotelDetailsState>(
  (ref) => HotelDetailsViewModel(ref.read(hotelDetailsUseCaseProvider)),
);

class HotelDetailsViewModel extends StateNotifier<HotelDetailsState> {
  final HotelDetailsUseCase hotelDetailsUseCase;

  HotelDetailsViewModel(this.hotelDetailsUseCase)
      : super(HotelDetailsState.initial());

  Future<void> fetchHotelById(String hotelId) async {
    state = state.copyWith(isLoading: true, selectedHotel: null);
    var data = await hotelDetailsUseCase.getHotelById(hotelId);

    data.fold(
      (l) => state =
          state.copyWith(isLoading: false, error: l.error, selectedHotel: null),
      (r) {
        final hotelDetails = HotelDetailsEntity(
          hotelId: r.hotelId,
          hotelName: r.hotelName,
          hotelPrice: r.hotelPrice,
          hotelDescription: r.hotelDescription,
          hotelCategory: r.hotelCategory,
          hotelImageUrl: r.hotelImageUrl ?? '',
        );
        state = state.copyWith(
          isLoading: false,
          selectedHotel: hotelDetails,
          error: null,
        );
      },
    );
  }
}
