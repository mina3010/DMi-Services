import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class RoundedContainerField extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final BoxBorder? border;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final EdgeInsets padding;
  final Widget? child;
  final String? title;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final bool isShadowed;
  final bool specificShadow;
  final double offset;
  final double blur;
  final Color? shadowColor;
  final bool isSuccess;
  final String? errorMessage;
  final ValueNotifier<bool> isFocused = ValueNotifier(false);

  RoundedContainerField({
    Key? key,
    this.height = 100,
    this.width,
    this.backgroundColor,
    this.margin,
    this.border,
    this.constraints,
    this.padding = const EdgeInsets.all(8.0),
    this.title = "",
    this.child,
    this.decoration,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.alignment = Alignment.center,
    this.isShadowed = true,
    this.specificShadow = false,
    this.shadowColor,
    this.offset = 0.01,
    this.blur = 1,
    this.isSuccess = false,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? "",
            style: AppTextTheme.medTextSize.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.colorGray,
              height: 0,
            ),
          ),
        ValueListenableBuilder(
          valueListenable: isFocused,
          builder: (_, __, ___) {
            final BoxBorder? border = (isFocused.value)
                ? Border.all(color: AppColors.primaryColor(context))
                : (isSuccess)
                    ? Border.all(color: AppColors.successColor)
                    : (errorMessage != null)
                        ? Border.all(color: AppColors.errorColor)
                        : this.border;
            return Container(
              height: height,
              width: width,
              margin: margin,
              padding: padding,
              alignment: alignment,
              constraints: constraints,
              decoration: decoration?.copyWith(
                    borderRadius: borderRadius,
                    border: border,
                    boxShadow: (isShadowed)
                        ? const [
                            BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 1),
                              blurRadius: 6,
                            ),
                          ]
                        : null,
                  ) ??
                  BoxDecoration(
                    color: backgroundColor ?? AppColors.whiteBlack(context),
                    border: border,
                    boxShadow: (isShadowed)
                        ? [
                            BoxShadow(
                              color: shadowColor ?? const Color(0x29000000),
                              offset: Offset(
                                  0, specificShadow == true ? offset : 1),
                              blurRadius: specificShadow == true ? blur : 6,
                            ),
                          ]
                        : null,
                    borderRadius: borderRadius,
                  ),
              child: (child.runtimeType == TextFormField)
                  ? FocusScope(
                      child: Focus(
                        onFocusChange: (focus) => isFocused.value = focus,
                        child: child!,
                      ),
                    )
                  : child,
            );
          },
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: AppDMIensions.padding_8),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDMIensions.padding_8,
            ),
            child: Text(
              "$errorMessage",
              textAlign: TextAlign.start,
              style: AppTextTheme.medTextSize.copyWith(
                color: AppColors.errorColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
