import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileActionListTile extends StatelessWidget {
  final String content;
  final String imageURL;
  final Function() onTap;

  const ProfileActionListTile({
    Key? key,
    required this.content,
    required this.imageURL,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDMIensions.padding_6),
      margin: const EdgeInsets.symmetric(horizontal: AppDMIensions.padding_10),
      child: ListTile(
        leading: SvgPicture.asset(imageURL),
        title: Text(
          content,
          style: AppTextTheme.medTextSize,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.colorAccent,
        ),
        tileColor: AppColors.gray2(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: onTap,
      ),
    );
  }
}
