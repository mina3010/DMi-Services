import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  final Function()? onRetry;

  const NoInternetScreen({Key? key, this.onRetry}) : super(key: key);

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
                      'internet_connection_unavailable'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextTheme.h3
                          .copyWith(color: AppColors.primaryColor(context)),
                    ),
                    Text(
                      'internet_connection_unavailable_message'.tr(),
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
                    ? () {
                        AppNavigation.instance.pop(context);
                        onRetry!();
                      }
                    : () => AppNavigation.instance.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
