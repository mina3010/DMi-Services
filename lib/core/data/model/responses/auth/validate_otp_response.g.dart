// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateOTPResponse _$ValidateOTPResponseFromJson(Map<String, dynamic> json) =>
    ValidateOTPResponse(
      key: json['key'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$ValidateOTPResponseToJson(
        ValidateOTPResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'phoneNumber': instance.phoneNumber,
    };
