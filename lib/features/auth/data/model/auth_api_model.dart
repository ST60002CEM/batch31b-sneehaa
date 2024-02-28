import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  AuthApiModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  //toEntity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
        userId: apiModel.userId,
        firstName: apiModel.firstName,
        lastName: apiModel.lastName,
        email: apiModel.email,
        password: apiModel.password);
  }

  //From Entiry
  factory AuthApiModel.fromEntity(AuthEntity authEntity) {
    return AuthApiModel(
        userId: authEntity.userId,
        firstName: authEntity.firstName,
        lastName: authEntity.lastName,
        email: authEntity.email,
        password: authEntity.password);
  }

  //FromJSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

      //ToJSON
    Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);
}