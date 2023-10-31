import 'package:json_annotation/json_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable()
class AppNotification {
  final String date;
  final String title;
  final String content;
  final String imageURL;
  bool isRead;

  AppNotification({
    required this.date,
    required this.title,
    required this.content,
    required this.imageURL,
    required this.isRead,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);
}
