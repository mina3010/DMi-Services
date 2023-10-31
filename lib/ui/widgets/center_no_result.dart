import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class CenterNoResult extends StatelessWidget {
  final String? text;

  const CenterNoResult({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "no_result".tr(),
        style: AppTextTheme.medTextSize.copyWith(color: AppColors.white),
      ),
    );
  }
}
