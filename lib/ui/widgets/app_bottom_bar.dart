import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/all_courses/screens/all_courses_screen.dart';
import 'package:DMI/ui/screens/home_screen/screens/home_screen.dart';
import 'package:DMI/ui/screens/main_screen/cubit/main_cubit.dart';
import 'package:DMI/ui/screens/main_screen/cubit/main_state.dart';
import 'package:DMI/ui/screens/more_screen/screens/more_screen.dart';
import 'package:DMI/ui/screens/notifications_screen/screens/notifications_screen.dart';
import 'package:DMI/ui/screens/profile_screen/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppBottomBarItems { home, profile, courses, notifications, more }

class AppBottomBar extends StatelessWidget {
  final AppBottomBarItems selectedItem;

  const AppBottomBar({
    Key? key,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (_, __) {},
      builder: (ctx, state) {
        return _bottomBar(ctx);
      },
    );
  }

  Widget _bottomBar(BuildContext ctx) {
    return Container(
      height: AppDMIensions.bottomBarHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor(ctx),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, -5),
            blurRadius: 20,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _appBottomBarButton(
            context: ctx,
            text: 'menu_home'.tr(),
            imageName: 'menu_home',
            screen: const HomeScreen(),
            isSelected: selectedItem == AppBottomBarItems.home,
          ),
          _appBottomBarButton(
            context: ctx,
            text: 'menu_profile'.tr(),
            imageName: 'menu_profile',
            screen: Container(),
            isSelected: selectedItem == AppBottomBarItems.profile,
            customOnTap: () {
              AppNavigation.instance.push(
                  SettingsProvider.globalNavigatorContext!,
                  const ProfileScreen());
            },
          ),
          _appBottomBarButton(
            context: ctx,
            text: 'menu_courses'.tr(),
            imageName: 'menu_courses',
            screen: Container(),
            isSelected: selectedItem == AppBottomBarItems.courses,
            customOnTap: () {
              AppNavigation.instance.push(
                  SettingsProvider.globalNavigatorContext!,
                  const AllCoursesScreen());
            },
          ),
          _appBottomBarButton(
            context: ctx,
            text: 'menu_notifications'.tr(),
            imageName: 'menu_notifications',
            showDot: true,
            screen: const NotificationsScreen(),
            isSelected: selectedItem == AppBottomBarItems.notifications,
            customOnTap: () {
              AppNavigation.instance.push(
                  SettingsProvider.globalNavigatorContext!,
                  const NotificationsScreen());
            },
          ),
          _appBottomBarButton(
            context: ctx,
            text: 'menu_more'.tr(),
            imageName: 'menu_more',
            customIconHeight: 18.0,
            screen: const MoreScreen(),
            isSelected: selectedItem == AppBottomBarItems.more,
            customOnTap: () {
              AppNavigation.instance.push(
                  SettingsProvider.globalNavigatorContext!, const MoreScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _appBottomBarButton({
    Key? key,
    required BuildContext context,
    required String? text,
    required String imageName,
    Widget? screen,
    Function()? customOnTap,
    double? customIconHeight,
    bool isSelected = false,
    bool showDot = false,
  }) {
    BuildContext? navContext = SettingsProvider.globalNavigatorContext;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: key,
        splashColor: Colors.transparent,
        onTap: (screen != null && customOnTap == null)
            ? () => AppNavigation.instance.push(navContext ?? context, screen)
            : customOnTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            color: (isSelected)
                ? AppColors.primaryLightColor(context)
                : AppColors.primaryColor(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: (text != null) ? 24.0 : 48.0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/svg/$imageName.svg",
                          fit: BoxFit.contain,
                          height: customIconHeight ??
                              AppDMIensions.bottomItemIconSize,
                        ),
                      ),
                    ),
                    if (showDot)
                      Positioned(
                        top: 0.0,
                        right:
                            (TranslationsConstants.isLTR(context)) ? 0.0 : 12.0,
                        left:
                            (TranslationsConstants.isLTR(context)) ? 12.0 : 0.0,
                        child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (text != null) ...[
                const SizedBox(height: AppDMIensions.padding_4),
                FittedBox(
                  child: Text(
                    text,
                    style: AppTextTheme.smallTextSize.copyWith(
                      color: AppColors.whiteBlack(context),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
