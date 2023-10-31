import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double iconSize;

  const CustomCloseButton({
    Key? key,
    this.iconSize = 24,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      color: AppColors.backgroundDarker,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(AppDMIensions.padding_4),
          child: Icon(Icons.close, size: iconSize),
        ),
      ),
    );
  }
}
