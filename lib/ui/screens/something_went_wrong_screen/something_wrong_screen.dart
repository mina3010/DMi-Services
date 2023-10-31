import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SomethingWrongScreen extends StatelessWidget {
  final Function()? onRetry;
  final FlutterErrorDetails? details;

  const SomethingWrongScreen({Key? key, this.onRetry, this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBlack(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDMIensions.padding_16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'something_went_wrong'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextTheme.h3
                          .copyWith(color: AppColors.primaryColor(context)),
                    ),
                    if (!Constants.isProductionMode && details != null)
                      Text(
                        "${details?.stack.toString().substring(0, 500)}",
                        textAlign: TextAlign.center,
                        style: AppTextTheme.h3.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                  ],
                ),
              ),
              AppButton(
                text: (onRetry != null) ? 'retry_again'.tr() : 'back'.tr(),
                onPressed: (onRetry != null)
                    ? onRetry
                    : () => AppNavigation.instance.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
