import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'booking_api_model.g.dart';

@JsonSerializable()
class HotelBookingApiModel {
  @JsonKey(name: '_id')
  final String? bookingId;
  final String hotelId;
  final String checkInDate;
  final String checkOutDate;
  final int adults;
  final int children;
  final int rooms;

  HotelBookingApiModel({
    this.bookingId,
    required this.hotelId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.adults,
    required this.children,
    required this.rooms,
  });

  factory HotelBookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$HotelBookingApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelBookingApiModelToJson(this);

  // Convert API model to domain entity
  HotelBookingEntity toEntity() {
    return HotelBookingEntity(
      bookingId: bookingId,
      hotelId: hotelId,
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      adults: adults,
      children: children,
      rooms: rooms,
    );
  }

  // Create API model from domain entity
  factory HotelBookingApiModel.fromEntity(HotelBookingEntity entity) {
    return HotelBookingApiModel(
      bookingId: entity.bookingId,
      hotelId: entity.hotelId,
      checkInDate: entity.checkInDate,
      checkOutDate: entity.checkOutDate,
      adults: entity.adults,
      children: entity.children,
      rooms: entity.rooms,
    );
  }
}
