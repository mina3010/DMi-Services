import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/enums/flavor.dart';
import 'package:DMI/core/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String domainSite = '';
  static const String baseAPI = '';
  static const String baseDevAPI = '';

  static const int paginationInitialPage = 1;
  static const int scrollControllerExtentAfterNextPage = 300;
  static const int scrollControllerExtentAfterDownloadSection = 100;

  static bool get isProductionMode =>
      AppConfig.instance.flavor == Flavor.prod && kReleaseMode;

  static const unAuthorizedStatusCode = 401;
  static const forbiddenStatusCode = 403;

  static const String routeSettingsBottomSheetName = "BottomSheet";

  static const eventDateFormat = 'dd MMM, yyyy';
  static const eventTimeFormat = 'hh:mm aa';

  static const int resultLimitCount = 50;

  static const suffixIconConstraints = BoxConstraints(minHeight: 20.0);

  static final urlPattern =
      RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
}

class TranslationsConstants {
  static const String localeEN = 'en';
  static const String localeAr = 'ar';

  static bool isEnglish(BuildContext context) =>
      (context.locale.languageCode == TranslationsConstants.localeEN);

  static bool isLTR(BuildContext context) =>
      (context.locale.languageCode == TranslationsConstants.localeEN);

  static bool isContainsArabic(String text) {
    RegExp exp = RegExp(r"^[\u0621-\u064A]+");
    return exp.hasMatch(text);
  }
}
