// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:DMI/core/data/model/responses/auth/app_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Preference {
  static const appUserKey = 'appUser';
  static const authTokenKey = 'authToken';
  static const localeKey = 'appLocale';
  static const skipIntroKey = 'skipIntro';

  late final ValueNotifier<AppUser?> appUser;

  void saveAppUser(AppUser? appUser);

  void updateAppUser(AppUser? newAppUser);

  String? get token;

  set token(String? token);

  String? get locale;

  set locale(String? locale);

  bool? get skipIntro;

  set skipIntro(bool? skipIntro);

  Future<bool?> clear();

  void removeAuthPrefs();
}

class PreferenceImpl extends Preference {
  @override
  late final ValueNotifier<AppUser?> appUser;

  SharedPreferences? sharedPreferences;

  PreferenceImpl({required this.sharedPreferences}) {
    appUser = ValueNotifier<AppUser?>((sharedPreferences
                ?.getString(Preference.appUserKey) !=
            null)
        ? AppUser.fromJson(
            json.decode(sharedPreferences!.getString(Preference.appUserKey)!))
        : null);
  }

  @override
  void saveAppUser(AppUser? appUser) => appUser == null
      ? sharedPreferences?.remove(Preference.appUserKey)
      : sharedPreferences?.setString(
          Preference.appUserKey, json.encode(appUser.toJson()));

  @override
  void updateAppUser(AppUser? newAppUser) {
    appUser.value = newAppUser;
    saveAppUser(newAppUser);
  }

  @override
  String? get token => sharedPreferences?.getString(Preference.authTokenKey);

  @override
  set token(String? token) => token == null
      ? sharedPreferences?.remove(Preference.authTokenKey)
      : sharedPreferences?.setString(Preference.authTokenKey, token);

  @override
  String? get locale => sharedPreferences?.getString(Preference.localeKey);

  @override
  set locale(String? locale) {
    locale == null
        ? sharedPreferences?.remove(Preference.localeKey)
        : sharedPreferences?.setString(Preference.localeKey, locale);
  }

  @override
  bool? get skipIntro => sharedPreferences?.getBool(Preference.skipIntroKey);

  @override
  set skipIntro(bool? skipIntro) => skipIntro == null
      ? sharedPreferences?.remove(Preference.skipIntroKey)
      : sharedPreferences?.setBool(Preference.skipIntroKey, skipIntro);

  @override
  Future<bool?> clear() {
    return sharedPreferences!.clear();
  }

  @override
  void removeAuthPrefs() {
    sharedPreferences?.remove(Preference.appUserKey);
    sharedPreferences?.remove(Preference.authTokenKey);
  }
}
