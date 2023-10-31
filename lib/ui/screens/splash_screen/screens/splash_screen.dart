import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/main_screen/cubit/main_cubit.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:DMI/ui/screens/splash_screen/cubit/splash_cubit.dart';
import 'package:DMI/ui/screens/splash_screen/cubit/splash_state.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  void _onStateChangeListener(BuildContext context, SplashState state) {
    if (state.isError) {
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
    } else if (state.isSuccessNavigateNext) {
      state.mapOrNull(successNavigateNext: (data) {
        if (data.locale != null) {
          EasyLocalization.of(context)?.setLocale(Locale(data.locale!));
          Provider.of<SettingsProvider>(context, listen: false)
              .settingsChanged();
        }
        AppNavigation.instance.pushReplacement(context, data.screen);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      lazy: false,
      create: (_) {
        final cubit = SplashCubit();

        GetIt.I.allReady().then((_) {
          MainCubit.get(context).init();
          cubit.initSplash();
        });

        return cubit;
      },
      child: BlocConsumer<SplashCubit, SplashState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            final cubit = SplashCubit.get(ctx);
            SettingsProvider.globalNavigatorContext =
                context.findAncestorStateOfType<State<Navigator>>()?.context;

            return Scaffold(
              backgroundColor: AppColors.background,
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDMIensions.padding_48),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: AppDMIensions.padding_24,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (state.isSuccessNeedsUpdate)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDMIensions.padding_12,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'app_needs_update'.tr(),
                                    style: AppTextTheme.h3.copyWith(
                                      color: AppColors.whiteBlack(context),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height:
                                      AppDMIensions.defaultHeightSeparated_16,
                                ),
                                AppButton(
                                  text: 'update_now'.tr(),
                                  color: AppColors.secondaryColor(context),
                                  onPressed: cubit.updateButtonPressed,
                                ),
                                const SizedBox(
                                  height:
                                      AppDMIensions.defaultHeightSeparated_16,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
