import 'dart:io';

import 'package:dio/dio.dart';
import 'package:DMI/core/error/failures.dart';

class DioUtils {
  static Failure getDioExceptionMessage(dynamic error, StackTrace stackTrace,
      {Failure? Function(int, Response<dynamic>?)? handleStatusCode}) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return const CancelFailure();

            case DioExceptionType.connectionTimeout:
              return const InternetFailure();

            case DioExceptionType.receiveTimeout:
              return const InternetFailure();

            case DioExceptionType.sendTimeout:
              return const InternetFailure();

            case DioExceptionType.badCertificate:
              return const ServerFailure();

            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 500:
                  return const ServerFailure();

                case 503:
                  return const ServerFailure();

                case 204:
                  return const NoContentFailure();

                case 401:
                  return const NotAuthorizedFailure();

                default:
                  return const ServerFailure();
              }

            case DioExceptionType.connectionError:
              return const InternetFailure();

            case DioExceptionType.unknown:
              if (error.response == null &&
                  error.response?.statusCode == null) {
                return const InternetFailure();
              }

              if (error.message?.contains("SocketException") == true) {
                return const InternetFailure();
              }

              switch (error.response?.statusCode) {
                case 500:
                  return const ServerFailure();

                case 503:
                  return const ServerFailure();

                case 204:
                  return const NoContentFailure();

                case 401:
                  return const NotAuthorizedFailure();

                default:
                  return handleStatusCode?.call(
                          error.response!.statusCode!, error.response) ??
                      const UnknownFailure();
              }
          }
        } else if (error is SocketException) {
          return const InternetFailure();
        }
        return const InternetFailure();
      } on FormatException {
        // logger.e(error, error, stackTrace);

        return const ServerFailure();
      } catch (error, _) {
        // logger.e(error, error, stacktrace);

        return const ServerFailure();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const ServerFailure();
      } else {
        return const ServerFailure();
      }
    }
  }
}
