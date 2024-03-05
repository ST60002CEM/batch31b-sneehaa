
import 'package:bookaway/config/routes/app_route.dart';
import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:bookaway/features/bookings/domain/use_case/book_booking_usecase.dart';
import 'package:bookaway/features/bookings/domain/use_case/delete_booking_usecase.dart';
import 'package:bookaway/features/bookings/domain/use_case/view_booking_usecase.dart';
import 'package:bookaway/features/bookings/presentation/state/booking_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelBookingViewModelProvider =
    StateNotifierProvider<HotelBookingViewModel, HotelBookingState>((ref) =>
        HotelBookingViewModel(
            ref.read(bookHotelBookingUseCaseProvider),
            ref.read(viewHotelBookingUseCaseProvider),
            ref.read(deleteHotelBookingUseCaseProvider)
           ));

class HotelBookingViewModel extends StateNotifier<HotelBookingState> {
  final BookHotelBookingUseCase _bookHotelBookingUseCase;
  final ViewHotelBookingUseCase _viewHotelBookingUseCase;
  final DeleteHotelBookingUseCase _deleteHotelBookingUseCase;


  HotelBookingViewModel(
      this._bookHotelBookingUseCase,
      this._viewHotelBookingUseCase,
      this._deleteHotelBookingUseCase,
      )
      : super(HotelBookingState.initial()) {
    getHotelBookings();
  }

  Future<void> bookHotelBooking(
      HotelBookingEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _bookHotelBookingUseCase.bookHotel(entity);
    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        EasyLoading.showError('Failed to Book Hotel Booking: ${failure.error}');
      },
      (success) async {
        EasyLoading.showSuccess('Hotel Booking Booked Successfully',
            dismissOnTap: false);
        state = state.copyWith(showMessage: true);
        await getHotelBookings();
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(
              context, AppRoute.viewbookedhotels);
        });
      },
    );
  }

  Future<void> getHotelBookings() async {
    state = state.copyWith(isLoading: true);
    final result = await _viewHotelBookingUseCase.getBookings();
    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.error);
      },
      (hotelBookings) {
        state = state.copyWith(hotelBookings: hotelBookings);
      },
    );
  }

  //DELETE HOTEL BOOKING
  Future<void> deleteHotelBooking(String bookingId) async {
    state = state.copyWith(isLoading: true);
    try {
      await _deleteHotelBookingUseCase.deleteBooking(bookingId);
      state = state.copyWith(isLoading: false, showMessage: false);
      EasyLoading.showSuccess('Hotel Booking Deleted Successfully',
          dismissOnTap: false);
      await getHotelBookings();
    } catch (error) {
      EasyLoading.showError('Failed to Delete Hotel Booking: $error');
      state = state.copyWith(isLoading: false);
    }
  }
}
