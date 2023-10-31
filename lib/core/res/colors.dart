import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColors {
  /// Primary colors
  static AppColor primary = const AppColor(colors: [
    Color(0xff0B7EBA),
    Color(0xff0e9fea),
    Color(0xFF68c5f6),
    Color(0xFFB2D8FF),
    Color(0xFFE3F1FF),
  ]);

  static MaterialColor primaryMaterial = const MaterialColor(
    0xff4576f5,
    {
      50: Color.fromRGBO(11, 126, 186, .1),
      100: Color.fromRGBO(11, 126, 186, .2),
      200: Color.fromRGBO(11, 126, 186, .3),
      300: Color.fromRGBO(11, 126, 186, .4),
      400: Color.fromRGBO(11, 126, 186, .5),
      500: Color.fromRGBO(11, 126, 186, .6),
      600: Color.fromRGBO(11, 126, 186, .7),
      700: Color.fromRGBO(11, 126, 186, .8),
      800: Color.fromRGBO(11, 126, 186, .9),
      900: Color.fromRGBO(11, 126, 186, 1),
    },
  );

  /// Semantic Colors
  static AppColor infoLinksColors = const AppColor(colors: [
    Color(0xFFAAD7F5),
    Color(0xFF1679BC),
  ]);

  static AppColor successColors = const AppColor(colors: [
    Color(0xFFB2E2CC),
    Color(0xFF2B9464),
  ]);

  static AppColor warningColors = const AppColor(colors: [
    Color(0xFFFFFAE6),
    Color(0xFFFFCC00),
    Color(0xFFFDED95),
  ]);

  static AppColor errorColors = const AppColor(colors: [
    Color(0xFFFAE8E9),
    Color(0xFFDE535C),
  ]);

  /// neutral Colors
  static AppColor neutralColors = const AppColor(colors: [
    Color(0xFFffffff),
    Color(0xFFF8F9FA),
    Color(0xFFF1F3F5),
    Color(0xFFE9ECEF),
    Color(0xFFDEE2E6),
    Color(0xFFCED4DA),
    Color(0xFFADB5BD),
    Color(0xFF6A7178),
    Color(0xFF4F575E),
    Color(0xFF181415),
    Color(0xFF101213),
  ]);

  static Color whiteBlack(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return AppColors.black;
    } else {
      return AppColors.white;
    }
  }

  static Color blackWhite(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return AppColors.background;
    } else {
      return AppColors.black;
    }
  }

  static Color primaryColor(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return const Color(0xff0B7EBA);
    } else {
      return const Color(0xff0B7EBA);
    }
  }

  static Color primaryLightColor(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return const Color(0xff4693C4);
    } else {
      return const Color(0xff4693C4);
    }
  }

  static Color secondaryColor(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return const Color(0xFFBAA6D1);
    } else {
      return const Color(0xff4576f5);
    }
  }

  static Color gray2(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return const Color(0xFF131313);
    } else {
      return neutralColors[2];
    }
  }

  static Color gray4(context) {
    final appSettings =
        Provider.of<SettingsProvider>(context, listen: false).appSettings.value;

    if (appSettings.isDark) {
      return const Color(0xFFE7E6EB);
    } else {
      return neutralColors[4];
    }
  }

  static Color background = const Color(0xfff7f7f7);
  static Color backgroundDarker = neutralColors[1];
  static Color colorIcon = const Color(0xff4576f5);

  static Color black = neutralColors[10];
  static Color blue = infoLinksColors[1];

  static const Color colorAccent = Color(0xffFF8B17);
  static const borderColor = Color(0xffDAE4FD);
  static Color colorAccentWithOpacity = primary[0].withOpacity(0.5);

  static Color grayDMImed = neutralColors[6];
  static Color colorGray = neutralColors[7];
  static Color colorGrayDarker = neutralColors[8];
  static Color grayLight = neutralColors[5];
  // static Color gray4 = neutralColors[4];
  static Color colorPrimaryVeryLight = primary[3];
  static Color green = successColors[1];
  static Color red = errorColors[1];
  static Color successColor = const Color(0xFF00ADA6);
  static Color errorColor = const Color(0xFFCE3E5D);
  static Color warningColor = const Color(0xFFFF9C3B);
  static Color white = neutralColors[0];
  static Color whatAppGreen = const Color(0xFF4CAF50);
  static const scaffoldBackground = Colors.transparent;
  static const greyColor = Color(0xffA3A3A3);
  static const greyTextColor = Color(0xff545454);
  static const orangePrimaryLight = Color(0xFFFFE2CE);
  static const orangePrimaryWarm = Color(0xFFFFC4A2);
  static const warmBlue = Color(0xFF1379CB);
  static const appBarColor = Color(0xff20A6ED);
  static const textFormFieldBorderColor = Color(0xffBABABA);
}
