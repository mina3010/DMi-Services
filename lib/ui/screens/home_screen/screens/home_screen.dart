import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/core/utils/extensions/bold_text_style.dart';
import 'package:DMI/core/utils/extensions/text_theme.dart';
import 'package:DMI/ui/screens/all_courses/screens/all_courses_screen.dart';
import 'package:DMI/ui/screens/home_screen/cubit/home_cubit.dart';
import 'package:DMI/ui/screens/home_screen/cubit/home_state.dart';
import 'package:DMI/ui/screens/home_screen/widgets/app_bar_user.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:DMI/ui/widgets/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final physics = const ScrollPhysics();

  void _onStateChangeListener(BuildContext context, HomeState state) {
    if (state.isSuccess) {
    } else if (state.isError) {
      state.mapOrNull(error: (data) {
        final errors = data.failure?.errors;
        if (errors?.parsingError == true) {
          AppNavigation.instance.push(context, const SomethingWrongScreen());
        } else if (errors?.errorMessage != null) {
          showErrorToast(context, errors!.errorMessage!.first);
        }
      });
    } else if (state.isNoInternet) {
      state.mapOrNull(noInternet: (data) {
        AppNavigation.instance
            .push(context, NoInternetScreen(onRetry: data.onRetry));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      lazy: false,
      create: (_) {
        return HomeCubit()..init();
      },
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            final cubit = HomeCubit.get(ctx);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light),
              child: (state.isLoading)
                  ? const CenterCircularLoading()
                  : Scaffold(
                      backgroundColor: AppColors.scaffoldBackground,
                      body: (state.isLoading)
                          ? const CenterCircularLoading()
                          : SafeArea(
                              child: ListView(
                                physics: physics,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDMIensions.padding_24,
                                    vertical: AppDMIensions.padding_8),
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: AppDMIensions.padding_32,
                                        top: AppDMIensions.padding_16),
                                    child: AppBarUser(),
                                  ),
                                  SizedBox(height: AppDMIensions.padding_8,),
                                ],
                              ),
                            ),
                    ),
            );
          }),
    );
  }
}
