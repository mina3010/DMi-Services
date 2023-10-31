import 'package:DMI/core/constants.dart';
import 'package:DMI/core/data/model/app/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static List<AppLanguage> appLanguages = [
    AppLanguage(value: TranslationsConstants.localeEN, name: 'arabic'),
    AppLanguage(value: TranslationsConstants.localeAr, name: 'english'),
  ];

  bool isDark;

  AppSettings({
    this.isDark = false,
  });

  factory AppSettings.fromPref(SharedPreferences prefs) {
    return AppSettings(
      isDark: prefs.getBool("isDark") ?? false,
    );
  }

  AppSettings copyWith({
    bool? isDark,
  }) {
    return AppSettings(
      isDark: isDark ?? this.isDark,
    );
  }
}
