import 'package:DMI/core/res/app_dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/res/theme/app_theme.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/all_courses/screens/all_courses_screen.dart';
import 'package:DMI/ui/screens/home_screen/screens/home_screen.dart';
import 'package:DMI/ui/screens/main_screen/cubit/main_cubit.dart';
import 'package:DMI/ui/screens/more_screen/screens/more_screen.dart';
import 'package:DMI/ui/screens/notifications_screen/screens/notifications_screen.dart';
import 'package:DMI/ui/screens/profile_screen/screens/profile_screen.dart';
import 'package:DMI/ui/screens/splash_screen/screens/splash_screen.dart';
import 'package:DMI/ui/widgets/app_bottom_bar.dart';
import 'package:DMI/ui/widgets/flavor_banner.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider(),
            lazy: false,
          ),
          BlocProvider<MainCubit>(
            lazy: false,
            create: (_) => MainCubit(),
          ),
        ],
        builder: (ctx, child) {
          final analytics = Provider.of<SettingsProvider>(ctx).analytics;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: MyApp.navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
                NavigationHistoryObserver(),
              ],
              onGenerateTitle: (_) {
                return 'app_name'.tr();
              },
              theme: appTheme,
              home: const SplashScreen(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: .95),
                  child: StreamBuilder(
                      stream: NavigationHistoryObserver().historyChangeStream,
                      builder: (context, navigationHistorySnapshot) {
                        final viewInsets = MediaQuery.of(context).viewInsets;
                        final isKeyboardOpen = viewInsets.bottom > 0;
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                color: AppColors.white,
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  fit: BoxFit.fitWidth,
                                  width: MediaQuery.of(context).size.width,
                                  "assets/images/png/background.png",
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              padding: EdgeInsets.only(
                                bottom: ((UniversalPlatform.isIOS)
                                        ? AppDMIensions.iOSScreenPadding
                                        : 0.0) +
                                    ((showAppBottomBar && !isKeyboardOpen)
                                        ? AppDMIensions.bottomBarHeight
                                        : 0),
                              ),
                              duration: const Duration(milliseconds: 500),
                              child: FlavorBanner(child: child!),
                            ),
                            AnimatedPositioned(
                              bottom: (showAppBottomBar)
                                  ? 0.0
                                  : -AppDMIensions.bottomBarHeight -
                                      ((UniversalPlatform.isIOS)
                                          ? AppDMIensions.iOSScreenPadding
                                          : 0.0),
                              duration: const Duration(milliseconds: 500),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: (UniversalPlatform.isIOS)
                                      ? AppDMIensions.iOSScreenPadding
                                      : 0.0,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: AppBottomBar(
                                    selectedItem: appBottomBarItem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              },
            ),
          );
        });
  }

  get showAppBottomBar =>
      isScreen(HomeScreen) ||
      isScreen(NotificationsScreen) ||
      isScreen(MoreScreen) ||
      isScreen(AllCoursesScreen) ||
      isScreen(ProfileScreen);

  AppBottomBarItems get appBottomBarItem {
    if (isScreen(HomeScreen)) {
      return AppBottomBarItems.home;
    } else if (isScreen(ProfileScreen)) {
      return AppBottomBarItems.profile;
    } else if (isScreen(AllCoursesScreen)) {
      return AppBottomBarItems.courses;
    } else if (isScreen(NotificationsScreen)) {
      return AppBottomBarItems.notifications;
    } else if (isScreen(MoreScreen)) {
      return AppBottomBarItems.more;
    } else {
      return AppBottomBarItems.home;
    }
  }
}
