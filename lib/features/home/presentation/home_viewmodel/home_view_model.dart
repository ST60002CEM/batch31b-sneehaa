import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookaway/features/home/domain/use_cases/home_use_case.dart';
import 'package:bookaway/features/home/presentation/state/home_state.dart';

final hotelViewModelProvider = StateNotifierProvider<HotelViewModel, HotelState>(
  (ref) {
    return HotelViewModel(ref.read(hotelUsecaseProvider));
  },
);

class HotelViewModel extends StateNotifier<HotelState> {
  final HotelUseCase hotelUseCase;

  HotelViewModel(this.hotelUseCase) : super(HotelState.initial()) {
    getAllHotels();
  }

  getAllHotels() async {
    state = state.copyWith(isLoading: true);
    var data = await hotelUseCase.getAllHotels();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, hotels: r, error: null),
    );
  }

}
