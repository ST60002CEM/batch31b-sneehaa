import 'package:equatable/equatable.dart';

class HotelDetails extends Equatable {
  final String hotelId;
  final String hotelName;
  final double hotelPrice;
  final String hotelDescription;
  final String hotelCategory;
  final String? hotelImageUrl;

  const HotelDetails(
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

  factory HotelDetails.fromJson(Map<String, dynamic> json) {
    return HotelDetails(
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
    return 'HotelDetails(hotelId: $hotelId, hotelName: $hotelName, hotelPrice: $hotelPrice, hotelDescription: $hotelDescription, hotelCategory: $hotelCategory, hotelImageUrl: $hotelImageUrl)';
  }
}
