import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:DMI/ui/widgets/cached_image.dart';
import 'package:DMI/ui/widgets/course_progress_bar.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCourseProgressCard extends StatelessWidget {
  const ProfileCourseProgressCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: 105,
      padding: const EdgeInsets.symmetric(
        vertical: AppDMIensions.padding_6,
        horizontal: AppDMIensions.padding_10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDMIensions.padding_10),
      backgroundColor: AppColors.primaryColor(context).withOpacity(0.9),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedImage(
              url: ProfileCubit.get(context).course.mainImageUrl,
              width: 120,
              height: 100,
            ),
          ),
          const SizedBox(
            width: AppDMIensions.padding_10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProfileCubit.get(context).course.title,
                  style: AppTextTheme.largeBtnTextSize.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/calendar_time_for_lesson.svg',
                    ),
                    const SizedBox(
                      width: AppDMIensions.padding_6,
                    ),
                    Text(
                      'lesson_with_number'.tr(
                        args: [
                          getArabicNumber(
                            context,
                            ProfileCubit.get(context).course.numOfLessons,
                          )
                        ],
                      ),
                      style: AppTextTheme.smallTextSize.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      width: AppDMIensions.padding_28,
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/people.svg',
                    ),
                    const SizedBox(
                      width: AppDMIensions.padding_6,
                    ),
                    Text(
                      ProfileCubit.get(context).course.type,
                      style: AppTextTheme.smallTextSize.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppDMIensions.padding_8,
                ),
                const CourseProgressBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
