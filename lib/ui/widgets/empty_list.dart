import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final String message;
  final String? customImage;
  final String? buttonText;
  final Function()? buttonOnPressed;

  const EmptyList({
    Key? key,
    required this.title,
    required this.message,
    this.customImage,
    this.buttonText,
    this.buttonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDMIensions.padding_16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDMIensions.padding_56),
                  child: Image.asset(
                    customImage ?? "assets/images/animated/no_data.gif",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.h3
                          .copyWith(color: AppColors.primaryColor(context)),
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.h3.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if (buttonText != null && buttonOnPressed != null)
                AppButton(
                  text: buttonText,
                  onPressed: buttonOnPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
