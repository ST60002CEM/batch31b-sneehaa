import 'package:bookaway/features/home/data/model/home_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_hotels_dto.g.dart';

@JsonSerializable()
class SearchHotelsDto {
  final String message;
  final List<HotelApiModel> search;

  SearchHotelsDto({
    required this.message,
    required this.search,
  });

  factory SearchHotelsDto.fromJson(Map<String, dynamic> json) =>
      _$SearchHotelsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHotelsDtoToJson(this);
}
