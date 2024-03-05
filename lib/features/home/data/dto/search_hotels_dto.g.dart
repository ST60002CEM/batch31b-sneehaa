// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hotels_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotelsDto _$SearchHotelsDtoFromJson(Map<String, dynamic> json) =>
    SearchHotelsDto(
      message: json['message'] as String,
      search: (json['search'] as List<dynamic>)
          .map((e) => HotelApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchHotelsDtoToJson(SearchHotelsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'search': instance.search,
    };
