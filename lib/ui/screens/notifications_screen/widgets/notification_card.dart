import 'package:DMI/core/data/model/responses/general/app_notification.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/widgets/cached_image.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      decoration: BoxDecoration(
        gradient: notification.isRead
            ? LinearGradient(
                colors: [AppColors.grayLight],
                stops: const [100],
              )
            : LinearGradient(
                colors: [AppColors.primary[3], AppColors.colorAccent],
                stops: const [0.98, 0.02],
              ),
      ),
      height: null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 5,
          ),
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            child: CachedImage(
              url: 'https://via.placeholder.com/350x150',
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: AppDMIensions.padding_8),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    dateTimeFormat(notification.date),
                    style: TextStyle(
                      fontSize: AppTextTheme.microTextSize.fontSize,
                      color: AppColors.black.withAlpha(80),
                    ),
                  ),
                  Text(notification.title, style: AppTextTheme.h4),
                  Text(
                    notification.content,
                    style: AppTextTheme.baseTextSizeMedium,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
