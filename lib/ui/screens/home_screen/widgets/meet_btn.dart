import 'package:auto_size_text/auto_size_text.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class MeetBtn extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const MeetBtn({
    Key? key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDMIensions.padding_8)),
          child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDMIensions.padding_12,
                  horizontal: AppDMIensions.padding_2),
              color: Colors.orange,
              child: AutoSizeText(
                text ?? "",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: AppTextTheme.smallTextSize.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ),
    );
  }
}
