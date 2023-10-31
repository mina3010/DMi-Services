import 'package:DMI/app.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/enums/flavor.dart';
import 'package:DMI/core/utils/app_config.dart';
import 'package:DMI/main_common.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.dev,
    baseAPI: Constants.baseDevAPI,
    child: const MyApp(),
  );

  runApp(await initMain(configuredApp));
}
