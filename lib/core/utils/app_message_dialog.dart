import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

Future<bool?> showAppMessageDialog(
  BuildContext context, {
  Widget? title,
  bool isTopTitle = false,
  String? message,
  String? noteMessage,
  Widget? customBody,
  bool? showButtonsConfirm,
  Widget? icon,
  void Function()? doneOnTap,
}) async {
  return await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AppMessageDialog(
      icon: icon,
      message: message,
      isTopTitle: isTopTitle,
      title: title,
      customBody: customBody,
      noteMessage: noteMessage,
      showButtonsConfirm: showButtonsConfirm,
      doneOnTap: doneOnTap,
    ),
  );
}

class AppMessageDialog extends StatelessWidget {
  final Widget? icon;
  final bool? showButtonsConfirm;
  final Widget? title;
  final Widget? customBody;
  final bool isTopTitle;
  final String? message;
  final String? noteMessage;
  final void Function()? doneOnTap;

  const AppMessageDialog({
    Key? key,
    this.title,
    this.icon,
    this.message,
    this.isTopTitle = false,
    this.showButtonsConfirm = false,
    this.noteMessage,
    this.customBody,
    this.doneOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDMIensions.padding_24),
          child: Material(
            borderRadius: BorderRadius.circular(AppDMIensions.padding_12),
            child: Padding(
              padding: const EdgeInsets.all(AppDMIensions.padding_24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isTopTitle && title != null) title!,
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(
                      height: AppDMIensions.padding_16,
                    ),
                  ],
                  if (!isTopTitle && title != null) title!,
                  if (customBody != null)
                    customBody!
                  else ...[
                    Text(
                      message ?? "",
                      style: AppTextTheme.medTextSize
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    if (showButtonsConfirm == true)
                      Padding(
                        padding: const EdgeInsets.all(
                          AppDMIensions.padding_8,
                        ),
                        child: Row(
                          children: [
                            _buttonDialog(
                                text: 'cancel'.tr(),
                                color: AppColors.red,
                                onPressed: () => Navigator.pop(context, false)),
                            const SizedBox(
                              width: AppDMIensions.padding_8,
                            ),
                            _buttonDialog(
                              text: 'confirm'.tr(),
                              color: AppColors.colorIcon,
                              onPressed: () => Navigator.pop(context, true),
                            ),
                          ],
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(AppDMIensions.padding_8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AppButton(
                            borderRadius:
                                BorderRadius.circular(AppDMIensions.padding_56),
                            color: AppColors.colorIcon,
                            text: 'done'.tr(),
                            toUpperCase: false,
                            onPressed: doneOnTap ??
                                () => AppNavigation.instance.pop(context),
                          ),
                        ),
                      ),
                    if (noteMessage != null) ...[
                      const SizedBox(
                        height: AppDMIensions.padding_8,
                      ),
                      Text(
                        noteMessage ?? "",
                        style: AppTextTheme.medTextSize.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonDialog({
    required String text,
    required Color color,
    required Function() onPressed,
  }) {
    return Expanded(
        child: SizedBox(
      height: AppDMIensions.padding_42,
      child: AppButton(
        color: color,
        elevation: 0,
        textColor: AppColors.white,
        text: text,
        toUpperCase: false,
        borderRadius: BorderRadius.circular(AppDMIensions.padding_32),
        onPressed: onPressed,
      ),
    ));
  }
}
