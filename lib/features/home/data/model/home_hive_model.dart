import 'package:bookaway/config/constants/hive_table_constants.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'home_hive_model.g.dart';


final hotelHiveModelProvider = Provider((ref) => HotelHiveModel.empty());

@HiveType(typeId: HiveTableConstant.hotelTableId)
class HotelHiveModel {
  @HiveField(0)
  final String hotelId;

  @HiveField(1)
  final String hotelName;

  @HiveField(2)
  final double hotelPrice;

  @HiveField(3)
  final String hotelDescription;

  @HiveField(4)
  final String hotelCategory;

  // empty constructor
  HotelHiveModel.empty()
      : this(
          hotelId: '',
          hotelName: '',
          hotelPrice: 0.0,
          hotelDescription: '',
          hotelCategory: '',
        );

  HotelHiveModel({
    String? hotelId,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelDescription,
    required this.hotelCategory,
  }) : hotelId = hotelId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  HotelEntity toEntity() => HotelEntity(
        hotelId: hotelId,
        hotelName: hotelName,
        hotelPrice: hotelPrice,
        hotelDescription: hotelDescription,
        hotelCategory: hotelCategory,
      );

  // Convert Entity to Hive Object
  HotelHiveModel toHiveModel(HotelEntity entity) => HotelHiveModel(
        hotelId: const Uuid().v4(),
        hotelName: entity.hotelName,
        hotelPrice: entity.hotelPrice,
        hotelDescription: entity.hotelDescription,
        hotelCategory: entity.hotelCategory,
      );

  // Convert Hive List to Entity List
  List<HotelEntity> toEntityList(List<HotelHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'hotelId: $hotelId, hotelName: $hotelName, hotelPrice: $hotelPrice, hotelDescription: $hotelDescription, hotelCategory: $hotelCategory';
  }
}
