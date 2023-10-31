import 'package:DMI/core/res/app_dimensions.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/data/model/app/preference.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_message_dialog.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/home_screen/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DioInterceptors {
  static const authorization = 'Authorization';

  late final Preference _preference;

  late final QueuedInterceptorsWrapper authInterceptor;

  String? appVersionNumber;
  bool isLoginExpiredDialogShowed = false;

  DioInterceptors({Preference? preference}) {
    _preference = preference ?? GetIt.instance.get<Preference>();
    PackageInfo.fromPlatform().then((packageInfo) {
      appVersionNumber = packageInfo.buildNumber;
    });
    setAuthInterceptor();
  }

  void resetLoginPreferences() {
    final context = SettingsProvider.globalNavigatorContext!;
    logout(context);
    showAppMessageDialog(
      context,
      title: Text(
        'logout_warning_title'.tr(),
        style: AppTextTheme.largerTextSize.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.colorIcon,
        ),
      ),
      message: 'logout_warning_message'.tr(),
      icon: SvgPicture.asset(
        height: AppDMIensions.padding_46,
        "assets/images/svg/warning.svg",
      ),
      // doneButtonText: 'ok'.tr(),
      doneOnTap: () {
        AppNavigation.instance.pushAndRemoveUntil(
          context,
          const HomeScreen(),
          (p) => false,
        );
      },
    );
  }

  void setAuthInterceptor() {
    authInterceptor = QueuedInterceptorsWrapper(onRequest: (
      RequestOptions options,
      RequestInterceptorHandler handler,
    ) {
      /// set the token
      final token = _preference.token;
      if (token != null) {
        options.headers[authorization] = 'Bearer $token';
      }

      options.headers['Accept'] = 'application/json';
      options.headers['app-version'] = appVersionNumber;
      options.headers['Lang'] = (_preference.locale == null)
          ? TranslationsConstants.localeEN
          : _preference.locale;
      return handler.next(options); //continue
    }, onResponse:
        (Response response, ResponseInterceptorHandler handler) async {
      return handler.next(response); //continue
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      // Do something with response error
      if (e.response?.statusCode == Constants.unAuthorizedStatusCode &&
          !isLoginExpiredDialogShowed) {
        isLoginExpiredDialogShowed = true;
        resetLoginPreferences();
      }

      return handler.next(e); //continue
    });
  }
}
