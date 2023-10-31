import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/login_screen/cubit/login_cubit.dart';
import 'package:DMI/ui/screens/login_screen/cubit/login_state.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:DMI/ui/widgets/custom_app_bar.dart';
import 'package:DMI/ui/widgets/custom_app_bar_back.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen>
    with TickerProviderStateMixin {
  TextEditingController nameTextEditorController = TextEditingController();

  void _onStateChangeListener(BuildContext context, LoginState state) {
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
        AppNavigation.instance.pushReplacement(context, data.screen);
      });
    }
  }

  @override
  void dispose() {
    nameTextEditorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      lazy: false,
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            final cubit = LoginCubit.get(ctx);

            return SafeArea(
              top: false,
              child: Scaffold(
                extendBody: false,
                appBar: CustomAppBar(
                  context,
                  title: 'profile_info'.tr(),
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
                backgroundColor: AppColors.scaffoldBackground,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'pick_image_and_enter_your_name'.tr(),
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: InkWell(
                            onTap: () {},
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.colorAccent)),
                              child: Center(
                                child: RoundedContainer(
                                  backgroundColor: AppColors.appBarColor,
                                  borderRadius: BorderRadius.circular(100),
                                  height: 120,
                                  width: 120,
                                  child: SvgPicture.asset(
                                      'assets/images/svg/image_picker.svg',),
                                ),
                              ),
                            ),
                          ),
                        ),
                        RoundedContainer(
                          height: 53.0,
                          backgroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32.0)),
                          border: Border.all(
                              color: const Color(0xffBABABA), width: 1),
                          child: TextFormField(
                            controller: nameTextEditorController,
                            keyboardType: TextInputType.phone,
                            autofillHints: const [
                              AutofillHints.name,
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                errorStyle: const TextStyle(height: 0.0),
                                hintText: 'enter_your_name'.tr()),
                            textDirection: mat.TextDirection.ltr,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 50),
                        AppButton(
                          text: 'complete'.tr(),
                          color: AppColors.colorAccent,
                          onPressed: () {
                            cubit.saveProfile();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
