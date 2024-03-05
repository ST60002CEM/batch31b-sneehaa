import 'package:bookaway/features/home/domain/use_cases/home_use_case.dart';
import 'package:bookaway/features/home/presentation/state/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>(
  (ref) {
    return SearchViewModel(ref.read(hotelUsecaseProvider));
  },
);

class SearchViewModel extends StateNotifier<SearchState> {
  final HotelUseCase hotelUseCase;

  SearchViewModel(this.hotelUseCase) : super(SearchState.initial());

  searchUsers(String searchText) async {
    if (searchText.isEmpty) {
      state = state.copyWith(hotels: []);
      return;
    }
    state = state.copyWith(isLoading: true, hotels: []);
    var data = await hotelUseCase.searchHotels(searchText);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error, hotels: []);
      },
      (r) {
        state = state.copyWith(isLoading: false, hotels: r, error: null);
      },
    );
  }
}
