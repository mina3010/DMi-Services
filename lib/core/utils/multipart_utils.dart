import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class MultipartUtils {
  static multipartFilesToJson(List<MultipartFile> multipartFiles) =>
      multipartFiles;

  static multipartFileToJson(MultipartFile? multipartFile) => multipartFile;

  static MultipartFile platformFileToMultipartFile(PlatformFile platformFile) {
    return MultipartFile.fromBytes(
      platformFile.bytes!.toList(),
      filename: platformFile.name,
    );
  }
}
