
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/notifications_screen/cubit/notifications_cubit.dart';
import 'package:DMI/ui/screens/notifications_screen/cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  void _onStateChangeListener(BuildContext context, NotificationsState state) {
    if (state.isError) {
      // _showError(context, 'something_went_wrong'.tr());
    } else if (state.isNoInternet) {
      state.mapOrNull(noInternet: (data) {
        AppNavigation.instance
            .push(context, NoInternetScreen(onRetry: data.onRetry));
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      lazy: false,
      create: (_) => NotificationsCubit(),
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            final cubit = NotificationsCubit.get(ctx);
            return Container();
          }),
    );
  }
}
