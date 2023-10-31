// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification(
      date: json['date'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      imageURL: json['imageURL'] as String,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'content': instance.content,
      'imageURL': instance.imageURL,
      'isRead': instance.isRead,
    };
