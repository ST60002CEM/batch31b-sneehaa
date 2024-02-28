import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_api_model.g.dart';

// Rest of your code here

final hotelApiModelProvider = Provider<HotelApiModel>(
  (ref) => const HotelApiModel.empty(),
);

@JsonSerializable()
class HotelApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? hotelId;
  final String hotelName;
  final double hotelPrice;
  final String hotelDescription;
  final String hotelCategory;
  final String? hotelImageUrl;

  const HotelApiModel({
    required this.hotelId,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelDescription,
    required this.hotelCategory,
    this.hotelImageUrl,
  });

  const HotelApiModel.empty()
      : hotelId = '',
        hotelName = '',
        hotelPrice = 0.0,
        hotelDescription = '',
        hotelCategory = '',
        hotelImageUrl = '';

  Map<String, dynamic> toJson() => _$HotelApiModelToJson(this);

  factory HotelApiModel.fromJson(Map<String, dynamic> json) =>
      _$HotelApiModelFromJson(json);

  // Convert API Object to Entity
  HotelEntity toEntity() => HotelEntity(
        hotelId: hotelId,
        hotelName: hotelName,
        hotelPrice: hotelPrice,
        hotelDescription: hotelDescription,
        hotelCategory: hotelCategory,
        hotelImageUrl: hotelImageUrl,
      );

  // Convert Entity to API Object
  HotelApiModel fromEntity(HotelEntity entity) => HotelApiModel(
        hotelId: entity.hotelId ?? '',
        hotelName: entity.hotelName,
        hotelPrice: entity.hotelPrice,
        hotelDescription: entity.hotelDescription,
        hotelCategory: entity.hotelCategory,
        hotelImageUrl: entity.hotelImageUrl,
      );

  // Convert API List to Entity List
  List<HotelEntity> toEntityList(List<HotelApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

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
