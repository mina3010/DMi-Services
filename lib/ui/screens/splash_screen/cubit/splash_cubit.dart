import 'package:DMI/core/data/model/app/preference.dart';
import 'package:DMI/ui/screens/login_screen/screens/login_screen.dart';
import 'package:DMI/ui/screens/splash_screen/cubit/splash_state.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashCubit extends Cubit<SplashState> {
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);

  late final Preference _preference;

  bool mustUpdate = false;

  SplashCubit({Preference? preference}) : super(const SplashState.initial()) {
    _preference = preference ?? GetIt.I.get<Preference>();
  }

  Future initSplash() async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 5),
    ));

    try {
      // await remoteConfig.fetchAndActivate();

      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      int? currentVersion = int.tryParse(packageInfo.buildNumber);

      int latestVersion = 0;

      // if (UniversalPlatform.isAndroid) {
      //   latestVersion = remoteConfig.getInt("android_last_version_code");
      // } else if (UniversalPlatform.isIOS) {
      //   latestVersion = remoteConfig.getInt("ios_last_version_code");
      // }

      if (latestVersion != currentVersion) {
        // Map<String, dynamic> mustUpdateMap = jsonDecode(remoteConfig
        //     .getValue((UniversalPlatform.isAndroid)
        //         ? "android_versions"
        //         : (UniversalPlatform.isIOS)
        //             ? "ios_versions"
        //             : "")
        //     .asString());

        // for (int i = currentVersion! + 1; i <= latestVersion; i++) {
        //   if (mustUpdateMap["$i"] == true) mustUpdate = true;
        // }
      }
    } catch (_) {}

    await Future.delayed(const Duration(seconds: 2));
    goToNextScreen();
  }

  Future<Widget> _nextScreen() async {
    return const LoginScreen();
  }

  Future goToNextScreen() async {
    if (mustUpdate) {
      emit(const SplashState.successNeedsUpdate());
    } else {
      emit(SplashState.successNavigateNext(
          await _nextScreen(), _preference.locale));
    }
  }

  void updateButtonPressed() {
    LaunchReview.launch(writeReview: false, iOSAppId: "");
  }
}
