
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/hotel_details_entity.dart';

part 'hotel_api_model.g.dart';

final hotelApiModelProvider = Provider<HotelDetailsApiModel>(
  (ref) => const HotelDetailsApiModel.empty(),
);

@JsonSerializable()
class HotelDetailsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? hotelId;
  final String hotelName;
  final double hotelPrice;
  final String hotelDescription;
  final String hotelCategory;
  final String? hotelImageUrl;

  const HotelDetailsApiModel({
    required this.hotelId,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelDescription,
    required this.hotelCategory,
    this.hotelImageUrl,
  });

  const HotelDetailsApiModel.empty()
      : hotelId = '',
        hotelName = '',
        hotelPrice = 0.0,
        hotelDescription = '',
        hotelCategory = '',
        hotelImageUrl = '';

  Map<String, dynamic> toJson() => _$HotelDetailsApiModelToJson(this);

  factory HotelDetailsApiModel.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsApiModelFromJson(json);

  // Convert API Object to Entity
  HotelDetails toEntity() => HotelDetails(
        hotelId: hotelId.toString(),
        hotelName: hotelName,
        hotelPrice: hotelPrice,
        hotelDescription: hotelDescription,
        hotelCategory: hotelCategory,
        hotelImageUrl: hotelImageUrl.toString(),
      );

  // Factory constructor to create HotelApiModel from a map
  factory HotelDetailsApiModel.fromMap(Map<String, dynamic> map) {
    return HotelDetailsApiModel(
      hotelId: map['hotelId'],
      hotelName: map['hotelName'],
      hotelPrice: map['hotelPrice'],
      hotelDescription: map['hotelDescription'],
      hotelCategory: map['hotelCategory'],
      hotelImageUrl: map['hotelImageUrl'],
    );
  }

  @override
  List<Object?> get props => [
        hotelId,
        hotelName,
        hotelPrice,
        hotelDescription,
        hotelCategory,
        hotelImageUrl,
      ];
}
