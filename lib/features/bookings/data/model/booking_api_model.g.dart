// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelBookingApiModel _$HotelBookingApiModelFromJson(
        Map<String, dynamic> json) =>
    HotelBookingApiModel(
      bookingId: json['_id'] as String?,
      hotelId: json['hotelId'] as String,
      checkInDate: json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] as String,
      adults: json['adults'] as int,
      children: json['children'] as int,
      rooms: json['rooms'] as int,
    );

Map<String, dynamic> _$HotelBookingApiModelToJson(
        HotelBookingApiModel instance) =>
    <String, dynamic>{
      '_id': instance.bookingId,
      'hotelId': instance.hotelId,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'adults': instance.adults,
      'children': instance.children,
      'rooms': instance.rooms,
    };
