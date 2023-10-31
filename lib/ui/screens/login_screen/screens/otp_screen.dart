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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpTextEditingController = TextEditingController();

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
                  title: 'phone_verification'.tr(),
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
                        horizontal: 10.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'verification_code'.tr(),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, left: 8.0),
                          child: Text(
                            'please_enter_verification_code'.tr(),
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'may_take_30_sec'.tr(),
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: PinCodeTextField(
                            length: 4,
                            obscureText: false,
                            enableActiveFill: true,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(17),
                                fieldHeight: 75,
                                fieldWidth: 55,
                                borderWidth: 1,
                                activeFillColor: AppColors.white,
                                selectedColor: const Color(0xffBABABA),
                                inactiveFillColor: AppColors.white,
                                selectedFillColor: AppColors.white,
                                inactiveColor: const Color(0xffBABABA)),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            cursorColor: AppColors.colorAccent,
                            backgroundColor: AppColors.scaffoldBackground,
                            controller: otpTextEditingController,
                            onCompleted: (v) {},
                            onChanged: (value) {},
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            appContext: context,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'did_not_get_code?'.tr(),
                                style: const TextStyle(fontSize: 14),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration.underline),
                                  foregroundColor: AppColors.appBarColor,
                                ),
                                child: Text(
                                  'resend'.tr(),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              text: 'next'.tr(),
                              color: AppColors.colorAccent,
                              onPressed: () {
                                cubit.otpCheck();
                              },
                            ),
                          ),
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
