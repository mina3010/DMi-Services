import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:DMI/core/providers/loader_progress.dart';
import 'package:get_it/get_it.dart';

class DioHelper {
  Dio dio;

  static CacheOptions cacheOptions = CacheOptions(
    store: MemCacheStore(),
    hitCacheOnErrorExcept: [],
    allowPostMethod: true,
  );

  DioHelper({required this.dio});

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool? forceCache,
    bool? cacheOneDay,
  }) async {
    return await dio.get<dynamic>(
      url,
      queryParameters: query,
      options: (forceCache == true)
          ? cacheOptions
              .copyWith(
                policy: CachePolicy.refreshForceCache,
                maxStale: (cacheOneDay == true)
                    ? const Nullable(Duration(days: 1))
                    : const Nullable(Duration(days: 7)),
              )
              .toOptions()
              .copyWith(
                headers: dio.options.headers
                  ..addAll(headers ?? <String, dynamic>{}),
              )
          : Options(
              headers: dio.options.headers
                ..addAll(headers ?? <String, dynamic>{}),
            ),
    );
  }

  Future<Response> postData({
    required String url,
    required dynamic body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Duration? receiveTimeout,
    bool? forceCache,
    bool? cacheOneDay,
  }) async {
    return await dio.post<dynamic>(
      url,
      data: body,
      queryParameters: query,
      options: (forceCache == true)
          ? cacheOptions
              .copyWith(
                policy: CachePolicy.refreshForceCache,
                maxStale: (cacheOneDay == true)
                    ? const Nullable(Duration(days: 1))
                    : const Nullable(Duration(days: 7)),
              )
              .toOptions()
              .copyWith(
                headers: dio.options.headers
                  ..addAll(headers ?? <String, dynamic>{}),
                receiveTimeout: receiveTimeout,
              )
          : Options(
              headers: dio.options.headers
                ..addAll(headers ?? <String, dynamic>{}),
              receiveTimeout: receiveTimeout,
            ),
      onSendProgress: (int sent, int total) {
        final progress = sent / total;
        if (GetIt.instance.isRegistered<LoaderProgress>()) {
          GetIt.instance.get<LoaderProgress>().progress.value = progress;
        }
      },
      onReceiveProgress: (_, __) {
        if (GetIt.instance.isRegistered<LoaderProgress>()) {
          GetIt.instance.get<LoaderProgress>().progress.value = null;
        }
      },
    );
  }

  Future<Response> putData({
    required String url,
    required dynamic body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.put<dynamic>(
      url,
      data: body,
      queryParameters: query,
      options: Options(
        headers: dio.options.headers..addAll(headers ?? <String, dynamic>{}),
      ),
    );
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete<dynamic>(
      url,
      data: body,
      queryParameters: query,
      options: Options(
        headers: dio.options.headers..addAll(headers ?? <String, dynamic>{}),
      ),
    );
  }
}
