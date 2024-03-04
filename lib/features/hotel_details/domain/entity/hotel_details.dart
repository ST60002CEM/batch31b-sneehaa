import 'package:equatable/equatable.dart';

class HotelDetailsEntity extends Equatable {
  final String hotelId;
  final String hotelName;
  final double hotelPrice;
  final String hotelDescription;
  final String hotelCategory;
  final String? hotelImageUrl;

  const HotelDetailsEntity(
      {required this.hotelId,
      required this.hotelName,
      required this.hotelPrice,
      required this.hotelDescription,
      required this.hotelCategory,
      this.hotelImageUrl});

  @override
  List<Object?> get props => [
        hotelId,
        hotelName,
        hotelPrice,
        hotelDescription,
        hotelCategory,
        hotelImageUrl
      ];

  factory HotelDetailsEntity.fromJson(Map<String, dynamic> json) {
    return HotelDetailsEntity(
      hotelId: json['hotelId'],
      hotelName: json['hotelName'],
      hotelPrice: json['hotelPrice'].toDouble(),
      hotelDescription: json['hotelDescription'],
      hotelCategory: json['hotelCategory'],
      hotelImageUrl: json['hotelImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hotelId': hotelId,
      'hotelName': hotelName,
      'hotelPrice': hotelPrice,
      'hotelDescription': hotelDescription,
      'hotelCategory': hotelCategory,
      'hotelImageUrl': hotelImageUrl,
    };
  }

  @override
  String toString() {
    return 'HotelDetailsEntity(hotelId: $hotelId, hotelName: $hotelName, hotelPrice: $hotelPrice, hotelDescription: $hotelDescription, hotelCategory: $hotelCategory, hotelImageUrl: $hotelImageUrl)';
  }
}
