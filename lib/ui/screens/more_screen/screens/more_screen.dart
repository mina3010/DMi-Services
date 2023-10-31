import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/about_screen/screens/about_screen.dart';
import 'package:DMI/ui/screens/contact_us_screen/screens/contact_us_screen.dart';
import 'package:DMI/ui/screens/donate_screen/screens/donate_screen.dart';
import 'package:DMI/ui/screens/more_screen/cubit/more_cubit.dart';
import 'package:DMI/ui/screens/more_screen/cubit/more_state.dart';
import 'package:DMI/ui/screens/more_screen/widgets/more_card.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  void _onStateChangeListener(BuildContext context, MoreState state) {
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
    return BlocProvider<MoreCubit>(
      lazy: false,
      create: (_) => MoreCubit(),
      child: BlocConsumer<MoreCubit, MoreState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            // final cubit = MoreCubit.get(ctx);
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              appBar: CustomAppBar(
                context,
                title: 'menu_more'.tr(),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDMIensions.padding_16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MoreCard(
                      content: 'about_us'.tr(),
                      imageURL: 'assets/images/svg/about.svg',
                      onTap: () {
                        AppNavigation.instance
                            .push(context, const AboutScreen());
                      },
                    ),
                    MoreCard(
                      content: 'donate_for_us'.tr(),
                      imageURL: 'assets/images/svg/donate_us.svg',
                      onTap: () {
                        AppNavigation.instance
                            .push(context, const DonateScreen());
                      },
                    ),
                    MoreCard(
                      content: 'contact_us'.tr(),
                      imageURL: 'assets/images/svg/contact_us.svg',
                      onTap: () {
                        AppNavigation.instance
                            .push(context, const ContactUsScreen());
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
