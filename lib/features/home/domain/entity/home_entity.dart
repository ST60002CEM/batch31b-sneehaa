import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  final String? hotelId;
  final String hotelName;
  final double hotelPrice;
  final String hotelDescription;
  final String hotelCategory;
  final String? hotelImageUrl;


  const HotelEntity({
    this.hotelId,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelDescription,
    required this.hotelCategory,
    this.hotelImageUrl,
  });

  @override
  List<Object?> get props => [
        hotelId,
        hotelName,
        hotelPrice,
        hotelDescription,
        hotelCategory,
        hotelImageUrl,
      ];

  factory HotelEntity.fromJson(Map<String, dynamic> json) {
    return HotelEntity(
      hotelId: json["_id"],
      hotelName: json["hotelName"],
      hotelPrice: json["hotelPrice"].toDouble(),
      hotelDescription: json["hotelDescription"],
      hotelCategory: json["hotelCategory"],
      hotelImageUrl: json["hotelImageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "hotelPrice": hotelPrice,
        "hotelDescription": hotelDescription,
        "hotelCategory": hotelCategory,
        "hotelImageUrl": hotelImageUrl,
      };

  @override
  String toString() {
    return 'HotelEntity(hotelId: $hotelId, hotelName: $hotelName, hotelPrice: $hotelPrice, hotelDescription: $hotelDescription, hotelCategory: $hotelCategory, hotelImageUrl: $hotelImageUrl';
  }
}
