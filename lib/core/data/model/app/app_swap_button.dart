import 'package:flutter/material.dart';

class AppSwapButton {
  final int index;
  final String text;
  final Widget? widget;
  final Widget? icon;
  final String? subText;

  AppSwapButton({
    required this.index,
    required this.text,
    this.widget,
    this.icon,
    this.subText,
  });

  AppSwapButton copyWith({
    Widget? widget,
    Widget? icon,
    String? subText,
    String? text,
  }) {
    return AppSwapButton(
      widget: widget ?? this.widget,
      subText: subText ?? this.subText,
      icon: icon ?? this.icon,
      index: index,
      text: text ?? this.text,
    );
  }
}
