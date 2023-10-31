import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:flutter/material.dart';

class CustomAppBarBackButton extends StatelessWidget {
  const CustomAppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          AppNavigation.instance.pop(context);
        },
        child: Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.colorAccent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 18,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
