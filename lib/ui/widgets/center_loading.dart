import 'package:DMI/core/providers/loader_progress.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CenterCircularLoading extends StatelessWidget {
  final bool showProgress;

  const CenterCircularLoading({
    Key? key,
    this.showProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = GetIt.I.get<LoaderProgress>().progress;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: AppColors.colorIcon,
          ),
          if (showProgress)
            ValueListenableBuilder(
              valueListenable: progress,
              builder: (_, __, ___) {
                if (progress.value != null) {
                  return Text(
                    '${(progress.value! * 100).toInt()}%',
                    style: AppTextTheme.h4,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
        ],
      ),
    );
  }
}
