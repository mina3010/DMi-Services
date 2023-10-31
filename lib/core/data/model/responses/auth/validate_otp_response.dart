import 'package:json_annotation/json_annotation.dart';

part 'validate_otp_response.g.dart';

@JsonSerializable()
class ValidateOTPResponse {
  final String key;
  final String phoneNumber;

  ValidateOTPResponse({
    required this.key,
    required this.phoneNumber,
  });

  factory ValidateOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateOTPResponseToJson(this);
}
