import 'package:DMI/core/error/app_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ResponseWrapper<T> {
  bool status;
  AppError? errors;
  T? data;

  ResponseWrapper({
    required this.status,
    required this.errors,
    required this.data,
  });

  factory ResponseWrapper.fromJson(
          Map<String, dynamic> data, T Function(Object? json) fromJsonT) =>
      _$ResponseWrapperFromJson<T>(data, fromJsonT);
}
