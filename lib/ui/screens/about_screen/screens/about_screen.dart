import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/about_screen/cubit/about_cubit.dart';
import 'package:DMI/ui/screens/about_screen/cubit/about_state.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/widgets/custom_app_bar.dart';
import 'package:DMI/ui/widgets/custom_app_bar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void _onStateChangeListener(BuildContext context, AboutState state) {
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
    return BlocProvider<AboutCubit>(
      lazy: false,
      create: (_) => AboutCubit(),
      child: BlocConsumer<AboutCubit, AboutState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            // final cubit = AboutCubit.get(ctx);
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              appBar: CustomAppBar(
                context,
                title: 'about_us'.tr(),
                backgroundColor: AppColors.appBarColor,
                titleColor: AppColors.white,
                centerTitle: false,
                leadingWidget: const CustomAppBarBackButton(),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: AppColors.appBarColor,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: AppDMIensions.padding_36,
                  ),
                  SvgPicture.asset('assets/images/logo.svg'),
                  const SizedBox(
                    height: AppDMIensions.padding_20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              """لنحذر جدًا في تفسيرنا لهذه العبارة، لئلا نظن وجود طبيعتين مختلفتين للشجر، أحداهما تنتمي إلى الله والأخرى لا تنتمي إليه، هذا خطأ في التفسير سبق لي أن عالجته في كتبي الأخرى وبخاصة عند الرد على أتباع ماني. وإنني سأوضح كيف أن هاتين الشجرتين لا تؤيدان معتقدهم:

أولًا: من الواضح أن رب المجد يتحدث عن البشر لا عن الطبيعة البشرية…

ثانيًا: إن الهراطقة يهتمون بالقول “لا تقدر شجرة جيدة أن تصنع أثمارًا رديئة ولا شجرة رديئة أن تصنع أثمارًا جيدة” وبهذا يظنون أنه لا يمكن لإنسان شرير أن يصير صالحًا ولا الصالح أن يصير شريرًا، مع أن المسيح لم يقل “لا تقدر شجرة جيدة أن تصير رديئة ولا رديئة أن تصير جيدة” بل قال “لا تقدر شجرة جيدة أن تصنع أثمارًا رديئة ولا شجرة رديئة أن تصنع أثمارًا جيدة”. فالشجرة هي روح الإنسان وثمارها هي أعماله. وبذلك لا يستطيع إنسان شرير أن يصنع أعمالًا """,
                              style: AppTextTheme.baseTextSizeMedium
                                  .copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.instagram),
                        color: AppColors.colorAccent,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.linkedinIn),
                        color: AppColors.colorAccent,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.twitter),
                        color: AppColors.colorAccent,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.facebookF),
                        color: AppColors.colorAccent,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
