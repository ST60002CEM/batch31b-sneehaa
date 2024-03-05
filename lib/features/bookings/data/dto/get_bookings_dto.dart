
import 'package:bookaway/features/bookings/data/model/booking_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_bookings_dto.g.dart';

@JsonSerializable()
class GetBookingsDTO {
  final bool success;
  @JsonKey(name: 'bookings')
  final List<HotelBookingApiModel> data;

  GetBookingsDTO({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetBookingsDTOToJson(this);

  factory GetBookingsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetBookingsDTOFromJson(json);
}
