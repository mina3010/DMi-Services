// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_wrapper_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseWrapperNotifications<T>
    _$PaginationResponseWrapperNotificationsFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        PaginationResponseWrapperNotifications<T>(
          allUserNotificationsCount: json['allUserNotificationsCount'] as int,
          hasNextPage: json['hasNextPage'] as bool,
          resultUserNotifications:
              (json['resultUserNotifications'] as List<dynamic>)
                  .map(fromJsonT)
                  .toList(),
        );
