// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalImage _$PersonalImageFromJson(Map<String, dynamic> json) =>
    PersonalImage(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$PersonalImageToJson(PersonalImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'isActive': instance.isActive,
    };
