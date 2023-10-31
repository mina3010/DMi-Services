import 'package:DMI/core/res/colors.dart';
import 'package:DMI/ui/widgets/center_loading.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? loaderColor;
  final Duration? cacheMaxAge;

  const CachedImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.loaderColor,
    this.cacheMaxAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      cacheMaxAge: cacheMaxAge ?? const Duration(days: 30),
      maxBytes: 10 * 1024 * 1024,
      cacheHeight: 512,
      // cacheWidth: 1024,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Padding(
              padding: EdgeInsets.all(30),
              child: CenterCircularLoading(),
            );
          case LoadState.failed:
            return Container(
              color: AppColors.primaryColor(context),
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}
