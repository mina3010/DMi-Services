import 'dart:ui';

import 'package:flutter/material.dart' show TextStyle;

extension BoldTextStyle on TextStyle? {
  get bold => this?.copyWith(fontWeight: FontWeight.bold);
}
