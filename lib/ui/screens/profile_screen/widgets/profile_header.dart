import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/data/model/responses/auth/app_user.dart';
import 'package:DMI/core/enums/gender.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<AppUser> userInfo = [
  AppUser(
    id: '0',
    gender: Gender.male,
    birthDate: '1/1/2000',
    email: 'temp@gmail.com',
    fullName: 'مودى ماهر مهدى',
    imageUrl:
        'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
    isAuthenticated: true,
    isBlocked: false,
    phoneNumber: '0100000000',
    token: 'token1',
  ),
];

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppDMIensions.padding_56,
        right: AppDMIensions.padding_10,
        left: AppDMIensions.padding_10,
        bottom: AppDMIensions.padding_16,
      ),
      color: AppColors.primary[4],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.colorAccent,
                  radius: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: CachedImage(
                      url: userInfo[0].imageUrl!,
                      width: 65,
                      height: 65,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppDMIensions.padding_10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfo[0].fullName,
                      style: AppTextTheme.baseBtnTextSize,
                    ),
                    Text(
                      'service_group_leader'.tr(),
                      style: AppTextTheme.smallTextSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/svg/edit.svg',
              height: AppDMIensions.padding_16,
              width: AppDMIensions.padding_16,
            ),
            label: Text(
              'edit'.tr(),
              style: AppTextTheme.smallBtnTextSize,
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}
