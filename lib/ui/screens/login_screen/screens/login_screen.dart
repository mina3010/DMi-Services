import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/login_screen/cubit/login_cubit.dart';
import 'package:DMI/ui/screens/login_screen/cubit/login_state.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:DMI/ui/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_country_code_picker/smart_country_code_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  final ValueNotifier<String> countryCodeNotifier =
      ValueNotifier<String>('+20');

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
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    countryCodeNotifier.dispose();
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
            SettingsProvider.globalNavigatorContext =
                context.findAncestorStateOfType<State<Navigator>>()?.context;

            return SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.scaffoldBackground,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/logo.svg',
                              width: 145,
                              height: 145,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'login'.tr(),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'enter_phone_number_to_login'.tr(),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: RoundedContainer(
                            height: 53.0,
                            backgroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            border: Border.all(
                                color: const Color(0xffBABABA), width: 1),
                            child: Directionality(
                              textDirection: mat.TextDirection.ltr,
                              child: Row(
                                children: [
                                  SmartCountryCodePicker(
                                    onChanged: (CountryCode countryCode) {
                                      countryCodeNotifier.value =
                                          countryCode.dialCode ?? '+20';
                                    },
                                    flagDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    padding: EdgeInsets.zero,
                                    initialSelection: 'EG',
                                    favorite: const [],
                                  ),
                                  const VerticalDivider(
                                    color: Color(0xffC3C3C3),
                                    thickness: 1.5,
                                    width: 1,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      // controller: phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      autofillHints: const [
                                        AutofillHints.telephoneNumber,
                                      ],
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                          border: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          errorStyle:
                                              const TextStyle(height: 0.0),
                                          hintText: 'phone_number'.tr()),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      textDirection: mat.TextDirection.ltr,
                                      validator: (value) {
                                        if (value == null || value.length < 8) {
                                          return '';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              text: 'login'.tr(),
                              color: AppColors.colorAccent,
                              onPressed: () {
                                cubit.login();
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
