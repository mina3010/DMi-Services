import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/ui/screens/contact_us_screen/cubit/contact_us_cubit.dart';
import 'package:DMI/ui/screens/contact_us_screen/cubit/contact_us_state.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/widgets/app_button.dart';
import 'package:DMI/ui/widgets/app_text_field.dart';
import 'package:DMI/ui/widgets/center_loading.dart';
import 'package:DMI/ui/widgets/custom_app_bar.dart';
import 'package:DMI/ui/widgets/custom_app_bar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() {
    return _ContactUsScreen();
  }
}

class _ContactUsScreen extends State<ContactUsScreen> {
  void _onStateChangeListener(BuildContext context, ContactUsState state) {
    if (state.isError) {
      // _showError(context, 'something_went_wrong'.tr());
    } else if (state.isNoInternet) {
      state.mapOrNull(noInternet: (data) {
        AppNavigation.instance
            .push(context, NoInternetScreen(onRetry: data.onRetry));
      });
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactUsCubit>(
      lazy: false,
      create: (_) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            // final cubit = ContactUsCubit.get(ctx);
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              appBar: CustomAppBar(
                context,
                title: 'contact_us'.tr(),
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
              body: (state.isLoading)
                  ? const CenterCircularLoading()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(
                        AppDMIensions.padding_16,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'contact_us_information_header'.tr(),
                            style: AppTextTheme.baseTextSizeMedium,
                          ),
                          const SizedBox(
                            height: AppDMIensions.padding_24,
                          ),
                          AppTextField(
                            height: 50,
                            backgroundColor: AppColors.white,
                            hint: 'your_name'.tr(),
                            controller: nameController,
                            inputType: TextInputType.name,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          const SizedBox(
                            height: AppDMIensions.padding_24,
                          ),
                          AppTextField(
                            height: 50,
                            backgroundColor: AppColors.white,
                            hint: 'your_phone'.tr(),
                            controller: phoneController,
                            inputType: TextInputType.number,
                            borderRadius: BorderRadius.circular(50),
                            format: [FilteringTextInputFormatter.digitsOnly],
                          ),
                          const SizedBox(
                            height: AppDMIensions.padding_24,
                          ),
                          AppTextField(
                            height: 50,
                            backgroundColor: AppColors.white,
                            hint: 'your_subject'.tr(),
                            controller: subjectController,
                            inputType: TextInputType.text,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          const SizedBox(
                            height: AppDMIensions.padding_24,
                          ),
                          AppTextField(
                            backgroundColor: AppColors.white,
                            height: 300,
                            hint: 'your_message'.tr(),
                            controller: messageController,
                            inputType: TextInputType.text,
                            borderRadius: BorderRadius.circular(50),
                            maxLines: null,
                          ),
                          const SizedBox(
                            height: AppDMIensions.padding_56,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              borderRadius: BorderRadius.circular(
                                  AppDMIensions.padding_56),
                              color: AppColors.colorAccent,
                              text: 'send_message'.tr(),
                              toUpperCase: false,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
