// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileApiModel _$ProfileApiModelFromJson(Map<String, dynamic> json) =>
    ProfileApiModel(
      userId: json['_id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProfileApiModelToJson(ProfileApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'image': instance.image,
    };
