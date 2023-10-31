import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:DMI/app.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/data/model/app/app_settings.dart';
import 'package:DMI/core/data/model/app/preference.dart';
import 'package:DMI/core/data/remote/dio_helper.dart';
import 'package:DMI/core/data/remote/dio_services.dart';
import 'package:DMI/core/data/remote/interceptors.dart';
import 'package:DMI/core/data/remote/remote_data_source.dart';
import 'package:DMI/core/providers/loader_progress.dart';
import 'package:DMI/ui/screens/about_screen/repository/about_repository.dart';
import 'package:DMI/ui/screens/all_courses/repository/all_courses_repository.dart';
import 'package:DMI/ui/screens/contact_us_screen/repository/contact_us_repository.dart';
import 'package:DMI/ui/screens/home_screen/repository/home_repository.dart';
import 'package:DMI/ui/screens/login_screen/repository/login_repository.dart';
import 'package:DMI/ui/screens/more_screen/repository/more_repository.dart';
import 'package:DMI/ui/screens/notifications_screen/repository/notifications_repository.dart';
import 'package:DMI/ui/screens/profile_screen/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_platform/universal_platform.dart';

final GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  //Components
  inject
    ..registerSingletonAsync<SharedPreferences>(() async {
      return SharedPreferences.getInstance();
    })
    ..registerSingletonAsync<Directory>(() async {
      return await getTemporaryDirectory();
    })
    ..registerSingletonWithDependencies<Preference>(
        () =>
            PreferenceImpl(sharedPreferences: inject.get<SharedPreferences>()),
        dependsOn: [SharedPreferences])
    ..registerSingleton<Alice>(Alice(
        navigatorKey: MyApp.navigatorKey,
        showNotification:
            UniversalPlatform.isAndroid && Constants.isProductionMode == false,
        darkTheme: false,
        showShareButton: true,
        showInspectorOnShake: Constants.isProductionMode == false))
    ..registerSingletonWithDependencies<ValueNotifier<AppSettings>>(
        () => ValueNotifier<AppSettings>(
            AppSettings.fromPref(inject.get<SharedPreferences>())),
        dependsOn: [SharedPreferences])
    ..registerSingletonWithDependencies(() => DioInterceptors(),
        dependsOn: [Preference])
    ..registerSingletonWithDependencies(
        () => dioInit(inject.get<DioInterceptors>(), inject.get<Alice>(),
            inject.get<Directory>()),
        dependsOn: [DioInterceptors, Directory])
    ..registerSingletonWithDependencies<DioHelper>(
        () => DioHelper(dio: inject.get<Dio>()),
        dependsOn: [Dio])
    ..registerSingletonWithDependencies<RemoteDataSource>(
        () => RemoteDataSourceImp(dioHelper: inject.get<DioHelper>()),
        dependsOn: [DioHelper])
    ..registerSingleton<LoaderProgress>(LoaderProgressImp())
    ..registerSingletonWithDependencies<HomeRepository>(
        () => HomeRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<LoginRepository>(
        () => LoginRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<NotificationsRepository>(
        () => NotificationsRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<MoreRepository>(
        () => MoreRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<AboutRepository>(
        () => AboutRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<AllCoursesRepository>(
        () => AllCoursesRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<ContactUsRepository>(
        () => ContactUsRepositoryImp(),
        dependsOn: [RemoteDataSource])
    ..registerSingletonWithDependencies<ProfileRepository>(
        () => ProfileRepositoryImp(),
        dependsOn: [RemoteDataSource]);
}
