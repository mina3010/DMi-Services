import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/di/injector_provider.dart';
import 'package:DMI/core/utils/app_config.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Widget> initMain(AppConfig child) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kReleaseMode);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await EasyLocalization.ensureInitialized();
  await setupInjection();

  ErrorWidget.builder =
      (FlutterErrorDetails details) => SomethingWrongScreen(details: details);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  return EasyLocalization(
    supportedLocales: const [
      Locale(TranslationsConstants.localeEN),
      Locale(TranslationsConstants.localeAr),
    ],
    path: 'assets/translations',
    startLocale: const Locale(TranslationsConstants.localeAr),
    fallbackLocale: const Locale(TranslationsConstants.localeAr),
    useOnlyLangCode: true,
    child: child,
  );
}
