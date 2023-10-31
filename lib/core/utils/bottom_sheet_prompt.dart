import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

Future<bool?> showPromptBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
  required String confirmButtonText,
  void Function()? confirmButtonOnPressed,
  required String cancelButtonText,
  void Function()? cancelButtonOnPressed,
}) async {
  return await showModalBottomSheet<bool>(
    shape: const RoundedRectangleBorder(
      //the rounded corner is created here
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context,
    builder: (context) => BottomSheetPrompt(
      title: title,
      description: description,
      confirmButtonText: confirmButtonText,
      confirmButtonOnPressed: confirmButtonOnPressed,
      cancelButtonText: cancelButtonText,
      cancelButtonOnPressed: cancelButtonOnPressed,
    ),
  );
}

class BottomSheetPrompt extends StatelessWidget {
  final String title;
  final String description;
  final String confirmButtonText;
  final void Function()? confirmButtonOnPressed;
  final String cancelButtonText;
  final void Function()? cancelButtonOnPressed;

  const BottomSheetPrompt({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.confirmButtonOnPressed,
    required this.cancelButtonText,
    this.cancelButtonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(AppDMIensions.padding_12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: AppTextTheme.largerTextSize.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor(context),
              ),
            ),
            Text(
              description,
              style: AppTextTheme.largeTextSize,
            ),
            const SizedBox(height: AppDMIensions.padding_12),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: cancelButtonOnPressed ??
                        () => Navigator.pop(context, false),
                    text: cancelButtonText,
                    color: Colors.transparent,
                    textColor: AppColors.primaryColor(context),
                    elevation: 0.0,
                  ),
                ),
                const SizedBox(
                  width: AppDMIensions.padding_8,
                ),
                Expanded(
                  child: AppButton(
                    text: confirmButtonText,
                    elevation: 0.0,
                    toUpperCase: false,
                    onPressed: confirmButtonOnPressed ??
                        () => Navigator.pop(context, true),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
