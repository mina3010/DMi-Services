import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? svgName;

  const AppHeader({
    Key? key,
    required this.title,
    this.svgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigation.instance.pop(context),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDMIensions.padding_24,
        ),
        width: MediaQuery.of(context).size.width,
        height: 135,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor(context), Colors.transparent],
            stops: const [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white),
                if (svgName != null) ...[
                  const SizedBox(
                    width: AppDMIensions.padding_24,
                  ),
                  SvgPicture.asset(
                    "assets/images/svg/$svgName.svg",
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcATop),
                  )
                ],
                const SizedBox(
                  width: AppDMIensions.padding_16,
                ),
                Text(
                  title,
                  style: AppTextTheme.largerTextSize
                      .copyWith(color: AppColors.white),
                )
              ],
            ),
            const SizedBox(
              height: AppDMIensions.padding_20,
            ),
            const Divider(
              thickness: 2,
              color: AppColors.greyColor,
            )
          ],
        ),
      ),
    );
  }
}
