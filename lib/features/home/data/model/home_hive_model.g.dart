// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelHiveModelAdapter extends TypeAdapter<HotelHiveModel> {
  @override
  final int typeId = 1;

  @override
  HotelHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelHiveModel(
      hotelId: fields[0] as String?,
      hotelName: fields[1] as String,
      hotelPrice: fields[2] as double,
      hotelDescription: fields[3] as String,
      hotelCategory: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HotelHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.hotelId)
      ..writeByte(1)
      ..write(obj.hotelName)
      ..writeByte(2)
      ..write(obj.hotelPrice)
      ..writeByte(3)
      ..write(obj.hotelDescription)
      ..writeByte(4)
      ..write(obj.hotelCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
