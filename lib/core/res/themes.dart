import 'package:DMI/core/res/fonts.dart';
import 'package:flutter/material.dart';

import 'app_dimensions.dart';
import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme(BuildContext context) {
    const fontFamily = AppFontFamily.tajawal;
    const textHeight = null;
    final fontColor = AppColors.blackWhite(context);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.colorAccent,
      unselectedWidgetColor: AppColors.colorGray,
      scaffoldBackgroundColor: AppColors.background,
      dividerColor: Colors.grey.shade300,
      fontFamily: fontFamily,
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        focusColor: AppColors.colorAccent,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorAccent),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.colorAccent,
        actionsIconTheme: IconThemeData(
          color: AppColors.white, //change your color here
        ),
        iconTheme: IconThemeData(
          color: AppColors.white, //change your color here
        ),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          height: textHeight,
          color: fontColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.colorAccent,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            height: textHeight,
            color: fontColor,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: AppDMIensions.buttonTextFontSize,
            color: AppColors.white,
            fontFamily: fontFamily,
            height: textHeight,
          ),
          padding: const EdgeInsets.all(8),
          backgroundColor: AppColors.colorAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDMIensions.borderRadius),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.colorAccent,
        textTheme: ButtonTextTheme.accent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDMIensions.borderRadius),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.colorAccent,
        selectionColor: AppColors.colorAccentWithOpacity,
        selectionHandleColor: AppColors.colorAccent,
      ),
    );
  }
}
