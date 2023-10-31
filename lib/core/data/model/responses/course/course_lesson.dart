import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_lesson.g.dart';

@JsonSerializable()
class CourseLesson {
  final int id;
  final String title;
  final String goal;
  final String story;
  final String witness;
  final String verse;
  final bool finished;

  CourseLesson({
    required this.id,
    required this.title,
    required this.goal,
    required this.story,
    required this.witness,
    required this.verse,
    required this.finished,
  });

  factory CourseLesson.fromJson(Map<String, dynamic> json) =>
      _$CourseLessonFromJson(json);

  Map<String, dynamic> toJson() => _$CourseLessonToJson(this);
}
