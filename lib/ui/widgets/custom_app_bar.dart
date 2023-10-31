import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee_widget/marquee_widget.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(
    BuildContext context, {
    Key? key,
    String? title,
    Widget? titleWidget,
    double? leadingWidth,
    bool autoFocus = false,
    Widget? leadingWidget,
    bool centerTitle = true,
    double? elevation = 0.0,
    List<Widget>? actions,
    SystemUiOverlayStyle? systemOverlayStyle,
    Color? backgroundColor = Colors.transparent,
    Color? titleColor,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: (elevation == 0.0)
                  ? null
                  : const [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 5),
                        blurRadius: 20,
                      )
                    ],
            ),
            child: AppBar(
              surfaceTintColor: Colors.transparent,
              scrolledUnderElevation: 0,
              key: key,
              toolbarHeight: 70.0,
              backgroundColor: backgroundColor ?? AppColors.background,
              title: (title != null)
                  ? Marquee(
                      direction: Axis.horizontal,
                      textDirection: TextDirection.rtl,
                      animationDuration: const Duration(seconds: 1),
                      backDuration: const Duration(seconds: 1),
                      autoRepeat: true,
                      pauseDuration: const Duration(seconds: 2),
                      directionMarguee: DirectionMarguee.TwoDirection,
                      child: Text(
                        title,
                        style: AppTextTheme.largerTextSize.copyWith(
                          fontWeight: FontWeight.w700,
                          color: titleColor ?? AppColors.blackWhite(context),
                        ),
                      ),
                    )
                  : titleWidget,
              leadingWidth: leadingWidth,
              elevation: elevation,
              centerTitle: centerTitle,
              systemOverlayStyle: systemOverlayStyle,
              leading: leadingWidget,
              actions: [
                if (actions != null) ...actions,
              ],
            ),
          ),
        );
}
