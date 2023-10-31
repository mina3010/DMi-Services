import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class ViewSection extends StatelessWidget {
  final String title;
  final String? leadingTitle;
  final VoidCallback? onPressed;
  final Widget child;

  const ViewSection({
    Key? key,
    required this.child,
    required this.title,
    this.leadingTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: AppTextTheme.medTextSize.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),
              if (leadingTitle != null)
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: onPressed,
                  child: Text(
                    leadingTitle!,
                    style: AppTextTheme.smallTextSize.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorAccent,
                    ),
                  ),
                )
            ],
          ),
        ),
        child
      ],
    );
  }
}
