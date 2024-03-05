import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;
  final String hotelId;
  final String userId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int adults;
  final int children;
  final int rooms;

  BookingEntity({
    required this.id,
    required this.hotelId,
    required this.userId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.adults,
    required this.children,
    required this.rooms,
  });

  @override
  List<Object?> get props => [
        id,
        hotelId,
        userId,
        checkInDate,
        checkOutDate,
        adults,
        children,
        rooms,
      ];
}
