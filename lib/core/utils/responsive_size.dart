import 'package:flutter/material.dart';

double widthToScreen(BuildContext ctx, double percent) {
  return MediaQuery.of(ctx).size.width * percent;
}

double heightToScreen(BuildContext ctx, double percent) {
  return MediaQuery.of(ctx).size.height * percent;
}

double scaleWidth(BuildContext ctx, double width) {
  double designWidth = 375.0;
  return width / designWidth * MediaQuery.of(ctx).size.width;
}

double scaleHeight(BuildContext ctx, double height) {
  double designHeight = 812.0;
  return height / designHeight * MediaQuery.of(ctx).size.height;
}
