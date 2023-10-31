import 'package:json_annotation/json_annotation.dart';

part 'pagination_response_wrapper_notifications.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginationResponseWrapperNotifications<T> {
  List<T> resultUserNotifications;
  bool hasNextPage;
  int allUserNotificationsCount;

  PaginationResponseWrapperNotifications({
    required this.allUserNotificationsCount,
    required this.hasNextPage,
    required this.resultUserNotifications,
  });

  factory PaginationResponseWrapperNotifications.fromJson(
          Map<String, dynamic> data, T Function(Object? json) fromJsonT) =>
      _$PaginationResponseWrapperNotificationsFromJson<T>(data, fromJsonT);
}
