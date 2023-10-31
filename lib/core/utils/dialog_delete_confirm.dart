import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_dialog.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

Future<bool?> showDialogDeleteConfirmation(
    BuildContext context, String itemName) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => DialogDeleteConfirm(itemName: itemName),
  );
}

class DialogDeleteConfirm extends StatelessWidget {
  final String itemName;
  const DialogDeleteConfirm({Key? key, required this.itemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'delete_confirm_title'.tr(),
            style: AppTextTheme.largerTextSize.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor(context),
            ),
          ),
          Text(
            'delete_confirm_message'.tr(args: [itemName]),
            style: AppTextTheme.largeTextSize,
          ),
          const SizedBox(height: AppDMIensions.padding_12),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () => Navigator.pop(context, false),
                  text: 'back'.tr(),
                  color: Colors.transparent,
                  textColor: AppColors.blackWhite(context),
                  elevation: 0.0,
                ),
              ),
              const SizedBox(
                width: AppDMIensions.padding_8,
              ),
              Expanded(
                child: AppButton(
                  text: 'ok'.tr(),
                  elevation: 0.0,
                  onPressed: () => Navigator.pop(context, true),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
