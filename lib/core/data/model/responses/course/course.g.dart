// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      title: json['title'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      date: json['date'] as String,
      numOfLessons: json['numOfLessons'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainImageUrl': instance.mainImageUrl,
      'date': instance.date,
      'numOfLessons': instance.numOfLessons,
      'type': instance.type,
      'description': instance.description,
    };
