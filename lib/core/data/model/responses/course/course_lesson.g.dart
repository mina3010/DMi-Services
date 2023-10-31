// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseLesson _$CourseLessonFromJson(Map<String, dynamic> json) => CourseLesson(
      id: json['id'] as int,
      title: json['title'] as String,
      goal: json['goal'] as String,
      story: json['story'] as String,
      witness: json['witness'] as String,
      verse: json['verse'] as String,
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$CourseLessonToJson(CourseLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'goal': instance.goal,
      'story': instance.story,
      'witness': instance.witness,
      'verse': instance.verse,
      'finished': instance.finished,
    };
