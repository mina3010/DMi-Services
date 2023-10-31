// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      imageUrl: json['mainImageURL'] as String?,
      token: json['token'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool,
      isBlocked: json['isBlocked'] as bool,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['genderId']),
      birthDate: json['BirthDate'] as String?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'BirthDate': instance.birthDate,
      'email': instance.email,
      'mainImageURL': instance.imageUrl,
      'token': instance.token,
      'isAuthenticated': instance.isAuthenticated,
      'isBlocked': instance.isBlocked,
      'genderId': _$GenderEnumMap[instance.gender],
    };

const _$GenderEnumMap = {
  Gender.male: 1,
  Gender.female: 2,
};
