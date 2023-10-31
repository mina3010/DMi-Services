
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:DMI/ui/screens/profile_screen/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _onStateChangeListener(BuildContext context, ProfileState state) {
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
    return BlocProvider<ProfileCubit>(
      lazy: false,
      create: (_) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            // final cubit = ProfileCubit.get(ctx);
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              body: Container(),
            );
          }),
    );
  }
}
