// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'booking_api_model.g.dart';

// @JsonSerializable()
// class BookingApiModel extends Equatable {
//   @JsonKey(name: '_id')
//   final String? bookingId;
//   final String? hotelId;
//   final DateTime checkInDate;
//   final DateTime checkOutDate;
//   final int adults;
//   final int children;
//   final int rooms;

//   const BookingApiModel({
//     required this.bookingId,
//     required this.hotelId,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.adults,
//     required this.children,
//     required this.rooms,
//   });

//   factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
//       _$BookingApiModelFromJson(json);

//   Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);

//   @override
//   List<Object?> get props => [
//         bookingId,
//         hotelId,
//         checkInDate,
//         checkOutDate,
//         adults,
//         children,
//         rooms,
//       ];
// }
