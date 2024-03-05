class HotelBookingEntity {
  final String? bookingId;
  final String hotelId;
  final String checkInDate;
  final String checkOutDate;
  final int adults;
  final int children;
  final int rooms;

  HotelBookingEntity({
    this.bookingId,
    required this.hotelId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.adults,
    required this.children,
    required this.rooms,
  });

  @override
  List<Object?> get props => [
        bookingId,
        hotelId,
        checkInDate,
        checkOutDate,
        adults,
        children,
        rooms,
      ];
}
