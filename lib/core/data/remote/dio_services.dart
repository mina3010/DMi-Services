import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/data/remote/dio_helper.dart';
import 'package:DMI/core/data/remote/interceptors.dart';
import 'package:DMI/core/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioInit(
    DioInterceptors appInterceptors, Alice? alice, Directory? directory) {
  final dio = dioWithoutRefreshTokenInit(appInterceptors, alice, directory);
  return dio;
}

Dio dioWithoutRefreshTokenInit(
  DioInterceptors appInterceptors,
  Alice? alice,
  Directory? directory,
) {
  final dio = Dio();
  // Set default configs
  dio.options.baseUrl = AppConfig.instance.baseAPI;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(minutes: 3);

  dio.interceptors.add(appInterceptors.authInterceptor);

  if (kReleaseMode) {
    // dio.interceptors.add(DioFirebasePerformanceInterceptor());
  }

  if (!Constants.isProductionMode) {
    if (alice != null) {
      dio.interceptors.add(alice.getDioInterceptor());
    }
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
    ));
  }

  // Cache only on Release mode
  if (!kDebugMode && directory != null) {
    final cacheStore = FileCacheStore(directory.path);
    DioHelper.cacheOptions = DioHelper.cacheOptions.copyWith(
      store: cacheStore,
    );
    dio.interceptors.add(DioCacheInterceptor(options: DioHelper.cacheOptions));
  }

  return dio;
}
