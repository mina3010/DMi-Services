import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final BoxBorder? border;
  final BoxDecoration? decoration;
  final EdgeInsets padding;
  final Widget? child;
  final BorderRadius borderRadius;
  final Alignment? alignment;
  final bool isShadowed;
  final bool specificShadow;
  final bool isInnerShadow;
  final double offset;
  final double blur;

  const RoundedContainer(
      {Key? key,
      this.height = 100,
      this.width,
      this.backgroundColor,
      this.margin,
      this.border,
      this.padding = const EdgeInsets.all(8.0),
      this.child,
      this.decoration,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
      this.alignment = Alignment.center,
      this.isShadowed = true,
      this.specificShadow = false,
      this.isInnerShadow = false,
      this.offset = 0.01,
      this.blur = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      alignment: alignment,
      decoration: decoration?.copyWith(
            borderRadius: borderRadius,
            border: border,
            boxShadow: (isShadowed)
                ? [
                    const BoxShadow(
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
                      color: const Color(0x29000000),
                      offset: Offset(0, specificShadow == true ? offset : 4),
                      blurRadius: specificShadow == true ? blur : 6,
                    ),
                  ]
                : isInnerShadow
                    ? [
                        const BoxShadow(
                          color: Color(0x29000000),
                        ),
                        BoxShadow(
                            color: AppColors.white,
                            blurRadius: 8.0,
                            blurStyle: BlurStyle.inner)
                      ]
                    : null,
            borderRadius: borderRadius,
          ),
      child: child,
    );
  }
}
