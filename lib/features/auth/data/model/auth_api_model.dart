import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? studentId;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String username;
  final String? password;

  AuthApiModel({
    this.studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      studentId: apiModel.studentId,
      fname: apiModel.fname,
      lname: apiModel.lname,
      image: apiModel.image,
      phone: apiModel.phone,
      username: apiModel.username,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      studentId: entity.studentId,
      fname: entity.fname,
      lname: entity.lname,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }
}
  