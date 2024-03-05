import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_api_model.g.dart';

@JsonSerializable()
class ProfileApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAdmin;
  String? image;

  ProfileApiModel({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
    this.image,
  });

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  //to entity
  ProfileEntity toEntity() {
    return ProfileEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      isAdmin: isAdmin,
      image: image ?? '',
    );
  }

  //from entity
  factory ProfileApiModel.fromEntity(ProfileEntity entity) {
    return ProfileApiModel(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      isAdmin: entity.isAdmin,
      image: entity.image,
    );
  }
}
