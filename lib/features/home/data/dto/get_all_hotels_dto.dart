import 'package:bookaway/features/home/data/model/home_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_hotels_dto.g.dart';

@JsonSerializable()
class GetAllHotelsDTO {
  final bool success;
  final int? count;
  @JsonKey(name: "hotelss") 
  final List<HotelApiModel> data;

  GetAllHotelsDTO({
    required this.success,
    this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllHotelsDTOToJson(this);

  factory GetAllHotelsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllHotelsDTOFromJson(json);
}
