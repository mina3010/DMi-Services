import 'package:DMI/core/data/model/responses/course/course.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  final Function() onPressed;

  const CourseTile({
    Key? key,
    required this.course,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.orangePrimaryLight,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          course.title,
          style: AppTextTheme.baseTextSize.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
