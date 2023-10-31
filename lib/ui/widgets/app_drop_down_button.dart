import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDropDownButton<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final Color? background;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? icon;
  final Widget? openIcon;
  final bool isSuccess;
  final String? errorMessage;
  final ValueNotifier<bool> isFocused = ValueNotifier(false);
  final bool withoutFocusBorder;

  AppDropDownButton({
    Key? key,
    this.value,
    required this.title,
    required this.items,
    this.onChanged,
    this.background,
    this.iconColor,
    this.textStyle,
    this.borderRadius,
    this.leading,
    this.borderColor,
    this.icon,
    this.openIcon,
    this.isSuccess = false,
    this.errorMessage,
    this.withoutFocusBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            if (leading != null) leading!,
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: isFocused,
                  builder: (_, __, ___) {
                    final BoxBorder? border = (isFocused.value)
                        ? (withoutFocusBorder == true)
                            ? null
                            : Border.all(color: AppColors.primaryColor(context))
                        : (isSuccess)
                            ? Border.all(color: AppColors.successColor)
                            : (errorMessage != null)
                                ? Border.all(color: AppColors.errorColor)
                                : Border.all(
                                    color: borderColor ?? AppColors.grayLight);
                    return RoundedContainer(
                      height: 60.0,
                      borderRadius: borderRadius ??
                          const BorderRadius.all(Radius.circular(8.0)),
                      backgroundColor: background ?? AppColors.gray2(context),
                      padding: EdgeInsets.symmetric(
                          horizontal: leading != null ? 0.0 : 8.0),
                      isShadowed: false,
                      border: border,
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) => isFocused.value = focus,
                          child: DropdownButtonFormField2<T>(
                            dropdownStyleData: DropdownStyleData(
                              elevation: 2,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                              ),
                            ),
                            iconStyleData: IconStyleData(
                              openMenuIcon: openIcon,
                              icon: icon ??
                                  SvgPicture.asset(
                                    "assets/images/svg/arrowdown2.svg",
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                      iconColor ?? Colors.black54,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                            ),
                            isDense: false,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.neutralColors[4]),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.neutralColors[4]),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.neutralColors[4]),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.neutralColors[4]),
                              ),
                            ),
                            value: value,
                            hint: Text(
                              title,
                              style: textStyle ??
                                  AppTextTheme.h5.copyWith(
                                    color: AppColors.colorGray,
                                  ),
                            ),
                            onChanged: onChanged,
                            items: items,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
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
