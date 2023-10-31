import 'package:alice/alice.dart';
import 'package:DMI/core/enums/flavor.dart';
import 'package:DMI/core/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:universal_platform/universal_platform.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    BannerConfig? bannerConfig;
    if (AppConfig.instance.flavor == Flavor.prod || UniversalPlatform.isIOS) {
      return child;
    } else {
      bannerConfig ??= _getDevBanner();
    }
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(context, bannerConfig),
      ],
    );
  }

  BannerConfig _getDevBanner() {
    return BannerConfig(bannerName: 'Dev', bannerColor: Colors.red);
  }

  Widget _buildBanner(BuildContext context, BannerConfig bannerConfig) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            GetIt.I<Alice>().showInspector();
          },
          child: CustomPaint(
            painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topEnd,
              color: bannerConfig.bannerColor,
            ),
          ),
        ),
      ),
    );
  }
}

class BannerConfig {
  BannerConfig({required this.bannerName, required this.bannerColor});

  final String bannerName;
  final Color bannerColor;
}
