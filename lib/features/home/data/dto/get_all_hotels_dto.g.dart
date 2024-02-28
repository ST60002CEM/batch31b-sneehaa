// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_hotels_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllHotelsDTO _$GetAllHotelsDTOFromJson(Map<String, dynamic> json) =>
    GetAllHotelsDTO(
      success: json['success'] as bool,
      count: json['count'] as int?,
      data: (json['hotelss'] as List<dynamic>)
          .map((e) => HotelApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllHotelsDTOToJson(GetAllHotelsDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'hotelss': instance.data,
    };
