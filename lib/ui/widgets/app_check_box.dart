import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Widget child;
  final void Function(bool?)? onChanged;
  final void Function()? onTap;

  const AppCheckBox({
    Key? key,
    required this.value,
    required this.child,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Theme(
            data: ThemeData(
              primaryColor: AppColors.primaryColor(context),
              unselectedWidgetColor: AppColors.secondaryColor(context),
            ),
            child: IgnorePointer(
              child: Checkbox(
                fillColor:
                    MaterialStateProperty.all(AppColors.primaryColor(context)),
                activeColor: AppColors.primaryColor(context),
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(width: AppDMIensions.padding_4),
          Padding(
            padding: const EdgeInsets.only(top: AppDMIensions.padding_4),
            child: child,
          ),
        ],
      ),
    );
  }
}
