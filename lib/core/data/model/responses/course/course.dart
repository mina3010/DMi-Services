import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final int id;
  final String title;
  final String mainImageUrl;
  final String date;
  final int numOfLessons;
  final String type;
  final String description;

  Course({
    required this.id,
    required this.title,
    required this.mainImageUrl,
    required this.date,
    required this.numOfLessons,
    required this.type,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
