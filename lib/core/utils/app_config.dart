import 'package:DMI/core/enums/flavor.dart';
import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final Flavor flavor;
  final String baseAPI;

  static late final AppConfig instance;

  AppConfig({
    Key? key,
    required this.flavor,
    required this.baseAPI,
    required Widget child,
  }) : super(child: child, key: key) {
    instance = this;
  }

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
