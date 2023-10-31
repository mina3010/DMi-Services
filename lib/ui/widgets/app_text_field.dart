import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  final double? height;
  final String? title;
  final String? hint;
  final Color? hintColor;
  final Widget? iconName;
  final Color? iconColor;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? isObscure;
  final bool isSuccess;
  final bool isLTR;
  final int? maxLines;
  final String? errorMessage;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool withBorder;
  final bool? enable;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? paddingField;
  final Widget? suffixIcon;
  final BoxConstraints? boxConstraints;
  final List<TextInputFormatter>? format;
  final Function(String value)? onChange;
  final FocusNode? focusNode;

  const AppTextField({
    Key? key,
    this.title,
    this.hint,
    this.hintColor,
    this.paddingField,
    this.boxConstraints,
    this.suffixIcon,
    this.borderColor,
    this.padding,
    this.enable,
    this.iconName,
    this.iconColor,
    this.borderRadius,
    required this.controller,
    required this.inputType,
    this.isObscure,
    this.focusNode,
    this.maxLines = 1,
    this.height = 45,
    this.isLTR = false,
    this.isSuccess = false,
    this.errorMessage,
    this.backgroundColor,
    this.format,
    this.onChange,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainerField(
      height: height,
      borderRadius:
          borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
      backgroundColor: backgroundColor ?? AppColors.background,
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppDMIensions.padding_16,
          ),
      isShadowed: false,
      border: (withBorder)
          ? Border.all(
              color: borderColor ?? AppColors.grayDMImed,
              width: 1.5,
            )
          : null,
      alignment: Alignment.topCenter,
      title: title,
      isSuccess: isSuccess,
      errorMessage: errorMessage,
      child: TextFormField(
        cursorColor: AppColors.colorIcon,
        obscureText: isObscure ?? false,
        controller: controller,
        focusNode: focusNode,
        keyboardType: inputType,
        textDirection: isLTR ? mat.TextDirection.ltr : null,
        maxLines: maxLines,
        enabled: enable,
        inputFormatters: format,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextTheme.medTextSize.copyWith(color: hintColor),
          border: InputBorder.none,
          enabledBorder: (withBorder) ? null : InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: paddingField ??
              const EdgeInsets.symmetric(
                vertical: AppDMIensions.padding_10,
              ),
          suffixIconConstraints: boxConstraints ??
              const BoxConstraints(
                  maxWidth: AppDMIensions.padding_24,
                  maxHeight: AppDMIensions.padding_24),
          suffixIcon: suffixIcon,
          icon: (iconName != null)
              ? SvgPicture.asset(
                  height: AppDMIensions.padding_20,
                  width: AppDMIensions.padding_16,
                  "assets/images/svg/$iconName.svg",
                  colorFilter: ColorFilter.mode(
                    iconColor ?? Colors.black54,
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
        onChanged: onChange != null ? (value) => onChange!(value) : null,
        onTapOutside: (e) {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
      ),
    );
  }
}
