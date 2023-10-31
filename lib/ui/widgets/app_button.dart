import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final void Function()? onPressed;
  final bool toUpperCase;
  final bool enabled;
  final Color? color;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;
  final double? iconPadding;
  final EdgeInsetsGeometry? padding;
  final bool? isInnerPadding;
  final double? elevation;
  final bool isIconSpacer;
  final Color? borderColor;
  final TextStyle? textStyle;
  const AppButton({
    Key? key,
    this.text,
    this.widget,
    this.toUpperCase = true,
    this.enabled = true,
    this.onPressed,
    this.color,
    this.textColor,
    this.textStyle,
    this.borderRadius,
    this.icon,
    this.iconPadding = AppDMIensions.padding_12,
    this.padding,
    this.isInnerPadding = true,
    this.elevation = 0.0,
    this.isIconSpacer = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 55.0),
        backgroundColor: color ?? AppColors.primaryColor(context),
        disabledForegroundColor: AppColors.whiteBlack(context),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(56.0),
          side: (borderColor != null)
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        elevation: elevation,
        padding: padding,
      ),
      onPressed: (enabled) ? onPressed : null,
      child: Padding(
        padding: isInnerPadding == true
            ? const EdgeInsets.only(
                top: AppDMIensions.padding_12,
                left: AppDMIensions.padding_8,
                right: AppDMIensions.padding_8,
                bottom: AppDMIensions.padding_8,
              )
            : EdgeInsets.zero,
        child: (widget != null)
            ? widget!
            : (icon == null)
                ? _text(context)
                : (isIconSpacer)
                    ? SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.0,
                              child: icon!,
                            ),
                            Center(child: _text(context)),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon!,
                          SizedBox(width: iconPadding!),
                          _text(context),
                        ],
                      ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Text(
      (toUpperCase) ? text!.toUpperCase() : text!,
      style: textStyle ??
          AppTextTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor ?? AppColors.whiteBlack(context),
          ),
    );
  }
}
