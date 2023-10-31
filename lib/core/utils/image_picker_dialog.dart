// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:DMI/core/utils/app_navigation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<List<PlatformFile>?> showGalleryAndCameraDialog({
  required BuildContext context,
  bool multiple = false,
}) async {
  return await showModalBottomSheet<List<PlatformFile>?>(
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context,
    builder: (context) => GalleryAndCamera(multiple: multiple),
  );
}

class GalleryAndCamera extends StatelessWidget {
  final bool multiple;

  final ImagePicker picker = ImagePicker();

  GalleryAndCamera({Key? key, required this.multiple}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDMIensions.padding_24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);

              if (photo != null) {
                int fileSizeInBytes = await photo.length();

                PlatformFile file = PlatformFile(
                  name: "${DateTime.now().millisecondsSinceEpoch}.jpg",
                  path: photo.path,
                  size: fileSizeInBytes,
                  bytes: await photo.readAsBytes(),
                );

                AppNavigation.instance.pop(context, arguments: [file]);
              }
            },
            child: Row(
              children: [
                Icon(Icons.camera_alt, color: AppColors.colorIcon),
                const SizedBox(
                  width: AppDMIensions.padding_12,
                ),
                Text(
                  'camera'.tr(),
                  style: AppTextTheme.largeTextSize.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppDMIensions.padding_12,
          ),
          const Divider(
            thickness: 1,
            endIndent: AppDMIensions.padding_12,
            indent: AppDMIensions.padding_12,
          ),
          const SizedBox(
            height: AppDMIensions.padding_12,
          ),
          InkWell(
            onTap: () async {
              final List<XFile> images = await picker.pickMultiImage();

              List<PlatformFile>? files;

              if (images.isNotEmpty) {
                files = [];

                for (final image in images) {
                  int fileSizeInBytes = await image.length();

                  PlatformFile file = PlatformFile(
                    name: "${DateTime.now().millisecondsSinceEpoch}.jpg",
                    path: image.path,
                    size: fileSizeInBytes,
                    bytes: await image.readAsBytes(),
                  );

                  files.add(file);
                }

                AppNavigation.instance.pop(context, arguments: files);
              }
            },
            child: Row(
              children: [
                Icon(Icons.image, color: AppColors.colorIcon),
                const SizedBox(
                  width: AppDMIensions.padding_12,
                ),
                Text(
                  'gallery'.tr(),
                  style: AppTextTheme.largeTextSize.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
