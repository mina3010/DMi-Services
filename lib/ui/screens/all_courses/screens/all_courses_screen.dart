import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:DMI/core/utils/common_functions.dart';
import 'package:DMI/ui/screens/all_courses/cubit/all_courses_cubit.dart';
import 'package:DMI/ui/screens/all_courses/cubit/all_courses_state.dart';
import 'package:DMI/ui/screens/no_internet_screen/no_internet_screen.dart';
import 'package:DMI/ui/screens/something_went_wrong_screen/something_wrong_screen.dart';
import 'package:DMI/ui/widgets/center_loading.dart';
import 'package:DMI/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  final physics = const ScrollPhysics();

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onStateChangeListener(BuildContext context, AllCoursesState state) {
    if (state.isSuccess) {
    } else if (state.isError) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllCoursesCubit>(
      lazy: false,
      create: (_) {
        return AllCoursesCubit()..init();
      },
      child: BlocConsumer<AllCoursesCubit, AllCoursesState>(
          listener: _onStateChangeListener,
          builder: (ctx, state) {
            final cubit = AllCoursesCubit.get(ctx);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light),
              child: Scaffold(
                backgroundColor: AppColors.scaffoldBackground,
                appBar: CustomAppBar(
                  context,
                  elevation: 0,
                  leadingWidget: InkWell(
                    onTap: () => AppNavigation.instance.pop(context),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        height: AppDMIensions.padding_32,
                        "assets/images/svg/ic_back.svg",
                        colorFilter: const ColorFilter.mode(
                          AppColors.colorAccent,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  title: 'courses'.tr(),
                ),
                body: (state.isLoading)
                    ? const CenterCircularLoading()
                    : Container(),
              ),
            );
          }),
    );
  }
}
