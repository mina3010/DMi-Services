import 'package:json_annotation/json_annotation.dart';

part 'course_level.g.dart';

@JsonSerializable()
class CourseLevel {
  final int id;
  final String courseLevel;

  CourseLevel({
    required this.id,
    required this.courseLevel,
  });

  factory CourseLevel.fromJson(Map<String, dynamic> json) =>
      _$CourseLevelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseLevelToJson(this);
}
