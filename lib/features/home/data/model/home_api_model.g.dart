// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelApiModel _$HotelApiModelFromJson(Map<String, dynamic> json) =>
    HotelApiModel(
      hotelId: json['_id'] as String?,
      hotelName: json['hotelName'] as String,
      hotelPrice: (json['hotelPrice'] as num).toDouble(),
      hotelDescription: json['hotelDescription'] as String,
      hotelCategory: json['hotelCategory'] as String,
      hotelImageUrl: json['hotelImageUrl'] as String?,
    );

Map<String, dynamic> _$HotelApiModelToJson(HotelApiModel instance) =>
    <String, dynamic>{
      '_id': instance.hotelId,
      'hotelName': instance.hotelName,
      'hotelPrice': instance.hotelPrice,
      'hotelDescription': instance.hotelDescription,
      'hotelCategory': instance.hotelCategory,
      'hotelImageUrl': instance.hotelImageUrl,
    };
