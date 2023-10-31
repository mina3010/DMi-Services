import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class AppBorders {
  static const textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        AppDMIensions.radius_32,
      ),
    ),
    borderSide: BorderSide(
      color: AppColors.textFormFieldBorderColor,
      width: AppDMIensions.textFormFieldBorderWidth,
    ),
  );
}
