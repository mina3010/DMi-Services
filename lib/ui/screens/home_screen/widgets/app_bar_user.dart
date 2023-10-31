import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/data/model/app/preference.dart';
import 'package:DMI/core/data/model/responses/auth/app_user.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class AppBarUser extends StatelessWidget {
  ValueNotifier<AppUser?> get appUserListener =>
      GetIt.I.get<Preference>().appUser;

  const AppBarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: appUserListener,
        builder: (_, appUser, __) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/images/svg/home_image.svg"),
              const SizedBox(width: AppDMIensions.padding_8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "welcome".tr(),
                          style: AppTextTheme.largerTextSize.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          appUser?.fullName ?? "",
                          style: AppTextTheme.largerTextSize.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'مِنْ أَفْوَاهِ الأَطْفَالِ وَالرُّضَّعِ أَسَّسْتَ حَمْدًا',
                      style: AppTextTheme.medTextSize.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
