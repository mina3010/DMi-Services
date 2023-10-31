import 'package:DMI/core/res/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final Widget child;
  const AppDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppDMIensions.padding_24,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(
            AppDMIensions.padding_12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppDMIensions.padding_12,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
