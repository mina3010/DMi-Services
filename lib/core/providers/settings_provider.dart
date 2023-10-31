import 'dart:isolate';
import 'dart:ui';

import 'package:DMI/core/data/model/app/app_settings.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static BuildContext? globalNavigatorContext;
  static bool deepLinkHandled = false;

  ValueNotifier<AppSettings> get appSettings =>
      GetIt.I.get<ValueNotifier<AppSettings>>();

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final ReceivePort _port = ReceivePort();

  SettingsProvider() {
    _downloadFilesInit();
    _initApp();
  }

  Future _initApp() async {
    analytics.logAppOpen();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // showNotificationDialog(globalNavigatorContext!, message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // showNotificationDialog(globalNavigatorContext!, message);
    });
  }

  Future<bool> saveAppSettings(AppSettings newAppSettings) async {
    try {
      final prefs = GetIt.I.get<SharedPreferences>();
      await prefs.setBool('isDark', newAppSettings.isDark);

      appSettings.value = newAppSettings;

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  void settingsChanged() {
    notifyListeners();
  }

  void appUserUpdatedInfo() {
    notifyListeners();
  }

  Future _downloadFilesInit() async {
    await FlutterDownloader.initialize(debug: !kReleaseMode);
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) async {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      // int progress = data[2];

      if (status == DownloadTaskStatus.complete) {
        await FlutterDownloader.loadTasksWithRawQuery(
            query: "SELECT * FROM task WHERE task_id='$id'");
      }
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }
}
