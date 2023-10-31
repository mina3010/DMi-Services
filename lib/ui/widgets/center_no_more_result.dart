import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:flutter/material.dart';

class CenterNoMoreResult extends StatelessWidget {
  final String? text;

  const CenterNoMoreResult({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "no_more_result".tr(),
        style: AppTextTheme.medTextSize,
      ),
    );
  }
}
