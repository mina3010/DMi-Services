import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/home_screen/screens/home_screen.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.colorAccent)),
                      child: Center(
                        child: RoundedContainer(
                          backgroundColor: AppColors.appBarColor,
                          borderRadius: BorderRadius.circular(100),
                          height: 120,
                          width: 120,
                          child: SvgPicture.asset(
                              'assets/images/svg/home_image.svg'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'welcome_name'.tr(args: ['مايكل ماهر']),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Text(
                      'thank_you_for_signup'.tr(),
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'you_can_now_browse_and_subscribe'.tr(),
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                text: 'start_now'.tr(),
                color: AppColors.colorAccent,
                onPressed: () {
                  AppNavigation.instance.push(context, const HomeScreen());
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
