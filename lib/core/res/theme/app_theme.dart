import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/res/fonts.dart';
import 'package:DMI/core/res/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get appTheme => ThemeData.from(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: AppFontFamily.tajawal),
      displayMedium: TextStyle(fontFamily: AppFontFamily.tajawal),
      displaySmall: TextStyle(fontFamily: AppFontFamily.tajawal),
      headlineLarge: TextStyle(fontFamily: AppFontFamily.tajawal),
      headlineMedium: TextStyle(fontFamily: AppFontFamily.tajawal),
      headlineSmall: TextStyle(fontFamily: AppFontFamily.tajawal),
      titleMedium: TextStyle(fontFamily: AppFontFamily.tajawal),
      titleLarge: TextStyle(fontFamily: AppFontFamily.tajawal),
      titleSmall: TextStyle(fontFamily: AppFontFamily.tajawal),
      labelLarge: TextStyle(fontFamily: AppFontFamily.tajawal),
      labelMedium: TextStyle(fontFamily: AppFontFamily.tajawal),
      labelSmall: TextStyle(fontFamily: AppFontFamily.tajawal),
      bodyLarge: TextStyle(fontFamily: AppFontFamily.tajawal),
      bodyMedium: TextStyle(fontFamily: AppFontFamily.tajawal),
      bodySmall: TextStyle(fontFamily: AppFontFamily.tajawal),
    ).apply(
      //apparently not working!!
      fontFamily: AppFontFamily.tajawal,
      displayColor: Colors.black,
      bodyColor: Colors.black,
    )).copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryMaterial,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))))
    // fontFamily: 'Poppins-Regular',
    );
