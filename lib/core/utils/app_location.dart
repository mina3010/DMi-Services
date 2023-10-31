import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/providers/settings_provider.dart';
import 'package:DMI/core/utils/bottom_sheet_prompt.dart';
import 'package:location/location.dart';

class AppLocation {
  static bool isDeniedOnce = false;
  static LocationData? lastPosition;

  static Future<bool> determinePosition({
    Function()? onGranted,
    bool forceAsk = false,
  }) async {
    if (isDeniedOnce && !forceAsk) {
      return false;
    }

    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    permissionGranted = await location.hasPermission();

    if (!serviceEnabled || permissionGranted != PermissionStatus.granted) {
      bool? isPrompted = await showPromptBottomSheet(
        context: SettingsProvider.globalNavigatorContext!,
        title: 'allow_location_title'.tr(),
        description: 'allow_location_description'.tr(),
        confirmButtonText: 'allow'.tr(),
        cancelButtonText: 'deny'.tr(),
      );

      if (!(isPrompted == true)) {
        isDeniedOnce = true;
        return false;
      }
    }

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        isDeniedOnce = true;
        return false;
      }
    }

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        isDeniedOnce = true;
        return false;
      }
    }

    if (onGranted != null) {
      onGranted();
    }

    isDeniedOnce = false;
    return true;
  }

  static Future<LocationData?> getLocationData({bool forceAsk = false}) async {
    if (isDeniedOnce && !forceAsk) {
      return null;
    }

    bool isGranted = await AppLocation.determinePosition();

    if (isGranted) {
      Location location = Location();
      try {
        lastPosition =
            await location.getLocation().timeout(const Duration(seconds: 2));
      } catch (_) {}
      isDeniedOnce = false;
      return lastPosition;
    } else {
      isDeniedOnce = true;
      return null;
    }
  }
}
