// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bookings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingsDTO _$GetBookingsDTOFromJson(Map<String, dynamic> json) =>
    GetBookingsDTO(
      success: json['success'] as bool,
      data: (json['bookings'] as List<dynamic>)
          .map((e) => HotelBookingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookingsDTOToJson(GetBookingsDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'bookings': instance.data,
    };
